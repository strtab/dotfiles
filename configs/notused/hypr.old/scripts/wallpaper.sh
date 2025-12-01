#!/usr/bin/env bash

# Script to:
# 1. On --startup: Only ensure swww-daemon is running.
# 2. Interactively (no args): Select and set new wallpaper via wofi, then apply themes.
# 3. Cyclically (--next/--prev): Set the next/previous wallpaper, then apply themes.
# 4. With --mute: Run silently without sending notifications.

# --- Configuration ---
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
WOFI_PROMPT="Select Wallpaper"

LOCK_FILE="/tmp/wallpaper.lock"
NOTIFICATIONS_MUTED=false

TRANSITION_TYPE="grow"
TRANSITION_STEP=10
TRANSITION_FPS=60
TRANSITION_BEZIER="0.7,0.8,2,3"

# --- File Paths ---

# --- NEW: Function to handle notifications ---
# This wrapper function checks the mute flag before sending a notification.
send_notification() {
    if [ "$NOTIFICATIONS_MUTED" = "false" ]; then
        notify-send "$@"
    fi
}
# ---

# --- Theme Application Function ---
apply_theme_and_reload() {
    local SELECTED_NEW_WALLPAPER_PATH="$1"

    if [ -z "$SELECTED_NEW_WALLPAPER_PATH" ] || [ ! -f "$SELECTED_NEW_WALLPAPER_PATH" ]; then
        send_notification -u critical "Wallpaper Script Error" "Invalid wallpaper path provided."
        return 1
    fi

    random_x=$(awk -v seed=$RANDOM 'BEGIN { srand(seed); printf "%.2f\n", rand() }')
    random_y=$(awk -v seed=$RANDOM 'BEGIN { srand(seed); printf "%.2f\n", rand() }')
    random_pos="${random_x},${random_y}"

    echo "Setting new wallpaper: $SELECTED_NEW_WALLPAPER_PATH (grow from $random_pos)"
    swww img "$SELECTED_NEW_WALLPAPER_PATH" \
        --transition-type "$TRANSITION_TYPE" \
        --transition-fps "$TRANSITION_FPS" \
        --transition-step "$TRANSITION_STEP" \
        --transition-pos "$random_pos" \
        ${TRANSITION_BEZIER:+--transition-bezier "$TRANSITION_BEZIER"}

    if [ $? -ne 0 ]; then send_notification -u critical "SWWW Error setting new wallpaper"; return 1; fi
    echo "New wallpaper set via swww."

    echo "Wallpaper and themes updated for $SELECTED_NEW_WALLPAPER_PATH."
    
    return 0
}

# --- Function to ensure swww-daemon is running ---
ensure_swww_daemon() {
    if ! pgrep -x "swww-daemon" > /dev/null; then
        echo "swww-daemon not running, attempting to initialize..."
        swww init >/dev/null 2>&1 && sleep 0.5
        if ! pgrep -x "swww-daemon" > /dev/null; then
            return 1 # Failure
        fi
        echo "swww-daemon initialized."
    fi
    return 0 # Success
}

# ---
# SCRIPT EXECUTION STARTS HERE
# ---

# NEW: Argument parsing for --mute flag
for arg in "$@"; do
    if [[ "$arg" == "--mute" ]]; then
        NOTIFICATIONS_MUTED=true
        echo "Notifications are muted."
    fi
done

# NEW: Lock file mechanism to prevent multiple instances
# The trap ensures the lock file is removed when the script exits, even on error.
trap 'rm -f "$LOCK_FILE"' EXIT
if [ -e "$LOCK_FILE" ]; then
    echo "Script is already running. Exiting."
    exit 1
else
    # Create the lock file to signal that the script is running
    touch "$LOCK_FILE"
fi
# ---

# --- Startup Mode ---
# This checks the first argument specifically.
if [[ "$1" == "--startup" ]]; then
    echo "Startup mode: Ensuring swww-daemon is running."
    if ! ensure_swww_daemon; then
        echo "Error: Failed to start swww-daemon on startup." >&2
        exit 1
    fi
    echo "swww-daemon is running. Startup script finished."
    exit 0
fi

# --- Check swww-daemon for all other modes ---
if ! ensure_swww_daemon; then
    send_notification -u critical "SWWW Error" "Failed to start swww-daemon for interactive mode."
    exit 1
fi

# --- Check for Wallpaper Directory ---
if [ ! -d "$WALLPAPER_DIR" ]; then
    send_notification -u critical "Wallpaper Script Error" "Directory '$WALLPAPER_DIR' not found."
    exit 1
fi

# --- Get Wallpaper List ---
if command -v fd &> /dev/null; then
    WALLPAPER_FILES=$(fd . "$WALLPAPER_DIR" -e png -e jpg -e jpeg -e gif -e webp --type f | sort)
else
    WALLPAPER_FILES=$(find "$WALLPAPER_DIR" -type f \( -iname '*.png' -o -iname '*.jpeg' -o -iname '*.jpg' -o -iname '*.gif' -o -iname '*.webp' \) | sort)
fi

if [ -z "$WALLPAPER_FILES" ]; then
    send_notification "Wallpaper Script Error" "No image files found in $WALLPAPER_DIR."
    exit 1
fi

# --- Cycling Mode (--next/--prev) ---
# This robustly checks if --next or --prev exists anywhere in the arguments
if [[ " $@ " =~ " --next " ]] || [[ " $@ " =~ " --prev " ]]; then
    echo "Cycling mode: Finding next/previous wallpaper."
    mapfile -t wallpaper_array < <(echo "$WALLPAPER_FILES")
    count=${#wallpaper_array[@]}
    current_wallpaper=$(swww query | head -n 1 | sed 's/.*: //')
    current_index=-1
    for i in "${!wallpaper_array[@]}"; do
        if [[ "${wallpaper_array[$i]}" == "$current_wallpaper" ]]; then
            current_index=$i
            break
        fi
    done
    if [[ $current_index -eq -1 ]]; then
        current_index=0
    fi
    if [[ " $@ " =~ " --next " ]]; then
        new_index=$(( (current_index + 1) % count ))
    else # --prev
        new_index=$(( (current_index - 1 + count) % count ))
    fi
    SELECTED_NEW_WALLPAPER_PATH="${wallpaper_array[$new_index]}"
    echo "Selected new wallpaper: $SELECTED_NEW_WALLPAPER_PATH"
    apply_theme_and_reload "$SELECTED_NEW_WALLPAPER_PATH"
    exit $?
fi

# --- Interactive Mode (using local cachy-selector) ---
echo "Interactive mode: Selecting new wallpaper with cachy-selector."

# The path to our custom selector, located in the same directory as this script.
# This is the robust way to call it, no matter where you run wallpaper.sh from.
SELECTOR_PATH="$(dirname "$0")/cachy-selector"

# We pipe the list of FULL PATHS directly into our app running in 'dmenu' mode.
# It will print the selected full path back to us.
SELECTED_NEW_WALLPAPER_PATH=$(echo "$WALLPAPER_FILES" | "$SELECTOR_PATH" dmenu)

if [ -z "$SELECTED_NEW_WALLPAPER_PATH" ]; then
    echo "No wallpaper selected."
    exit 0
fi

# We can directly use the output, since our app gives us the full path.
# The check below is still good practice.
if [ ! -f "$SELECTED_NEW_WALLPAPER_PATH" ]; then
    send_notification -u critical "Wallpaper Script Error" "Selector returned an invalid path: '$SELECTED_NEW_WALLPAPER_PATH'."
    exit 1
fi

apply_theme_and_reload "$SELECTED_NEW_WALLPAPER_PATH"
exit $?

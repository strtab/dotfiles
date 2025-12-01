#!/usr/bin/env python3
"""
Quickshell sequences.txt to Zathura config converter
Reads the already-generated terminal/sequences.txt file
Usage: python3 zathura_converter.py
"""
import os
import re
from pathlib import Path

HOME = os.getenv("HOME")
XDG_STATE_HOME = os.getenv("XDG_STATE_HOME", f"{HOME}/.local/state")
XDG_CONFIG_HOME = os.getenv("XDG_CONFIG_HOME", f"{HOME}/.config")

SEQUENCES_FILE = f"{XDG_STATE_HOME}/quickshell/user/generated/terminal/sequences.txt"
ZATHURA_CONFIG_DIR = f"{XDG_CONFIG_HOME}/zathura"
COLORSCHEME_FILE = f"{ZATHURA_CONFIG_DIR}/colorscheme"
ZATHURA_DEFAULT_FILE = f"{ZATHURA_CONFIG_DIR}/zathurarc.def"
OUTPUT_FILE = f"{ZATHURA_CONFIG_DIR}/zathurarc"


def parse_sequences(filepath):
    """Parse sequences.txt file and extract terminal colors"""
    palette = {}
    
    try:
        with open(filepath, "r") as f:
            content = f.read()
    except FileNotFoundError:
        print(f"Error: file {filepath} not found")
        print(f"Make sure you've run the Quickshell color generation script first.")
        return None
    
    # Parse terminal colors: ]4;N;#RRGGBB
    for match in re.finditer(r'\]4;(\d+);#([0-9A-Fa-f]{6})', content):
        color_index = int(match.group(1))
        hex_color = "#" + match.group(2).lower()
        palette[f"term{color_index}"] = hex_color
    
    # Parse foreground (]10;#RRGGBB)
    for match in re.finditer(r'\]10;#([0-9A-Fa-f]{6})', content):
        palette["foreground"] = "#" + match.group(1).lower()
    
    # Parse background (]11;#RRGGBB)
    for match in re.finditer(r'\]11;#([0-9A-Fa-f]{6})', content):
        palette["background"] = "#" + match.group(1).lower()
    
    return palette


def hex_to_rgba(hex_color, alpha=1.0):
    """Convert hex color to rgba format"""
    hex_color = hex_color.lstrip('#')
    r = int(hex_color[0:2], 16)
    g = int(hex_color[2:4], 16)
    b = int(hex_color[4:6], 16)
    return f"rgba({r},{g},{b},{alpha})"


def generate_zathura_config(palette):
    """Generate Zathura config from palette"""
    
    # Default fallbacks
    defaults = {
        "term0": "#000000",
        "term1": "#ff0000",
        "term2": "#00ff00",
        "term3": "#ffff00",
        "term4": "#0000ff",
        "term5": "#ff00ff",
        "term6": "#00ffff",
        "term7": "#ffffff",
        "term8": "#808080",
        "term9": "#ff8080",
        "term10": "#80ff80",
        "term11": "#ffff80",
        "term12": "#8080ff",
        "term13": "#ff80ff",
        "term14": "#80ffff",
        "term15": "#c0c0c0",
        "foreground": "#ffffff",
        "background": "#000000",
    }
    
    # Merge with parsed palette
    colors = {**defaults, **palette}
    
    # Convert to rgba format
    rgba_colors = {k: hex_to_rgba(v) for k, v in colors.items()}
    
    config = """# Auto-generated Zathura config from Quickshell palette
set default-bg "{background}"
set default-fg "{foreground}"

# Recolor mode (inverted colors)
set recolor-lightcolor "{background}"
set recolor-darkcolor "{foreground}"

# Status bar
set statusbar-bg "{term0}"
set statusbar-fg "{foreground}"

# Input bar
set inputbar-bg "{term0}"
set inputbar-fg "{foreground}"

# Notifications
set notification-bg "{term0}"
set notification-fg "{foreground}"
set notification-error-bg "{term1}"
set notification-error-fg "{foreground}"
set notification-warning-bg "{term3}"
set notification-warning-fg "{term0}"

# Completion
set completion-bg "{term8}"
set completion-fg "{term7}"
set completion-group-bg "{term0}"
set completion-group-fg "{term7}"
set completion-highlight-bg "{term4}"
set completion-highlight-fg "{foreground}"

# Index
set index-bg "{term0}"
set index-fg "{foreground}"
set index-active-bg "{term4}"
set index-active-fg "{foreground}"

# Render
set render-loading-bg "{term0}"
set render-loading-fg "{foreground}"
"""
    
    # Replace variables with colors (using rgba format)
    for var, color in rgba_colors.items():
        config = config.replace("{" + var + "}", color)
    
    return config


def main():
    print(f"Loading colors from {SEQUENCES_FILE}...")
    palette = parse_sequences(SEQUENCES_FILE)
    
    if not palette:
        return
    
    print(f"Found {len(palette)} colors:")
    for color_name in sorted([c for c in palette.keys() if c.startswith("term")]):
        print(f"  {color_name}: {palette[color_name]}")
    if "foreground" in palette:
        print(f"  foreground: {palette['foreground']}")
    if "background" in palette:
        print(f"  background: {palette['background']}")
    
    config = generate_zathura_config(palette)
    
    # Create directory if it doesn't exist
    Path(OUTPUT_FILE).parent.mkdir(parents=True, exist_ok=True)
    
    with open(OUTPUT_FILE, "w") as f:
        f.write(config)
    
    print(f"\n✓ Colorscheme saved to {COLORSCHEME_FILE}")
    
    # Merge colorscheme with zathurarc.def
    print(f"Merging with {ZATHURA_DEFAULT_FILE}...")
    
    merged_config = ""
    
    # Read default config if it exists
    if Path(ZATHURA_DEFAULT_FILE).exists():
        with open(ZATHURA_DEFAULT_FILE, "r") as f:
            merged_config = f.read()
        # Remove any existing include colorscheme lines
        merged_config = "\n".join(
            line for line in merged_config.split("\n")
            if "include" not in line or "colorscheme" not in line
        )
    
    # Add colorscheme at the end
    merged_config = merged_config.rstrip() + "\n\n# Auto-generated colorscheme\n"
    merged_config += config + "\n"
    
    # Write merged config
    with open(OUTPUT_FILE, "w") as f:
        f.write(merged_config)
    
    print(f"✓ Merged config saved to {OUTPUT_FILE}")
    print("\nZathura will automatically use this config.")


if __name__ == "__main__":
    main()

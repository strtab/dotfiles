
# https://github.com/christianholman/rofi_notes

# default values
NOTES_FOLDER="$HOME/.notes"
NOTES_EDITOR='kitty --class kitty-floating -e nvim '

theme=~/.config/rofi/notes/style.rasi

if [[ ! -d "${NOTES_FOLDER}" ]]; then
    mkdir -p "$NOTES_FOLDER"
fi

get_notes() {
    ls "${NOTES_FOLDER}"
}

edit_note() {
    note_location=$1
    $NOTES_EDITOR "$note_location"
}

delete_note() {
    local note=$1
    local action=$(echo -e "yes\nno" | rofi -theme $theme -dmenu -p "Are you sure you want to delete $note? ")

    case $action in
        "yes")
            rm "$NOTES_FOLDER/$note"
            main
            ;;
        "no")
            main
    esac
}

rename_note() {
    local note=$1
    local new_title=$(echo -e "cancel" | rofi -theme $theme -dmenu -p "new title: ")

    case "$new_title" in
        "cancel")
            main
            ;;
        *)
            mv "$NOTES_FOLDER/$note" "$NOTES_FOLDER/$new_title"
            main
            ;;
    esac
}

note_context() {
    local note=$1
    local note_location="$NOTES_FOLDER/$note"
    local action=$(echo -e "edit\nrename\ndelete" | rofi -theme $theme -dmenu -p "$note")
    case $action in
        "edit")
            edit_note "$note_location"
            exit 0;;
        "rename")
            rename_note "$note"
            exit 0;;
        "delete")
            delete_note "$note"
			      exit 0;;
    esac

	exit 1
}

new_note() {
    local title=$(echo -e "cancel" | rofi -theme $theme -dmenu -p "Input title: ")

    case "$title" in
        "cancel")
            main
            ;;
        *)
            local file=$(echo "$title" | sed 's/ /_/g;s/\(.*\)/\L\1/g')

            note_location="$NOTES_FOLDER/$file"
            if [ "$title" != "" ]; then
                echo edit_note "$note_location"
                exit 0
            fi
            ;;
    esac
}

main()
{
    local all_notes="$(get_notes)"

    if [ "$all_notes" ];then
        first_menu="${all_notes}"
    fi

    local note=$(echo -e "$first_menu"  | rofi -theme $theme -dmenu -p "notes")

    case $note in
        "new")
            new_note
            ;;
        "")
            exit 1;;
        *)
            note_context "$note" && exit 0 # handle esc key in note_context
    esac
	
	exit 1
}


main

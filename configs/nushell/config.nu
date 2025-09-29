$env.config = {
	show_banner: false

	use_kitty_protocol: true

  error_style: "fancy"

  table: {
        mode: rounded
        index_mode: always
        show_empty: false
        padding: { left: 1, right: 1 }
        trim: {
            methodology: wrapping
            wrapping_try_keep_words: true
            truncating_suffix: "..."
        }
        header_on_separator: false
    }

  completions: {
        case_sensitive: false
        quick: true  
        partial: true  
        algorithm: "fuzzy"    # prefix or fuzzy
        external: {
            enable: true
            max_results: 30
            completer: null
        }
        use_ls_colors: true
    }

  explore: {
        status_bar_background: { fg: "#1D1F21", bg: "#C4C9C6" },
        command_bar_text: { fg: "#C4C9C6" },
        highlight: { fg: "black", bg: "yellow" },
        status: {
            error: { fg: "white", bg: "red" },
            warn: {}
            info: {}
        },
        selected_cell: { bg: light_blue },
    }

	highlight_resolved_externals: true

	edit_mode: "vi"

  menus: [
    {
            name: completion_menu
            only_buffer_difference: false
            marker: " "
            type: {
                layout: columnar
                columns: 4
                col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
                col_padding: 2
            }
            style: {
                text: green
                selected_text: { attr: r }
                description_text: green
                match_text: { attr: u }
                selected_match_text: { attr: ur }
            }
        }
    {
            name: ide_completion_menu
            only_buffer_difference: false
            marker: " "
            type: {
                layout: ide
                min_completion_width: 0,
                max_completion_width: 50,
                max_completion_height: 10, # will be limited by the available lines in the terminal
                padding: 0,
                border: true,
                cursor_offset: 0,
                description_mode: "prefer_right"
                min_description_width: 0
                max_description_width: 50
                max_description_height: 10
                description_offset: 1
                # If true, the cursor pos will be corrected, so the suggestions match up with the typed text
                #
                # C:\> str
                #      str join
                #      str trim
                #      str split
                correct_cursor_pos: false
            }
            style: {
                text: green
                selected_text: { attr: r }
                description_text: yellow
                match_text: { attr: u }
                selected_match_text: { attr: ur }
            }
        }
      {
            name: history_menu
            only_buffer_difference: true
            marker: " "
            type: {
                layout: list
                page_size: 10
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
        }
  ]
}

source ~/.dotfiles/configs/nushell/plugins/zoxide.nu
source ~/.config/nushell/aliases.nu
source ~/.cache/carapace/init.nu

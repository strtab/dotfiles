return {
	"stevearc/oil.nvim",
		require("oil").setup({
			default_file_explorer = true,
			columns = {
				-- "icon",
				"permissions",
				"size",
				-- "mtime",
			},
			delete_to_trash = true,
			watch_for_changes = false,
			keymaps = {
				["g?"] = { "actions.show_help", mode = "n" },
				["<CR>"] = "actions.select",
				["<C-s>"] = { "actions.select", opts = { vertical = true } },
				["<C-h>"] = { "actions.select", opts = { horizontal = true } },
				["<C-t>"] = { "actions.select", opts = { tab = true } },
				["<C-p>"] = "actions.preview",
				["<C-c>"] = { "actions.close", mode = "n" },
				["<C-l>"] = "actions.refresh",
				["-"] = { "actions.parent", mode = "n" },
				["_"] = { "actions.open_cwd", mode = "n" },
				["`"] = { "actions.cd", mode = "n" },
				["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
				["gs"] = { "actions.change_sort", mode = "n" },
				["gx"] = "actions.open_external",
				["g."] = { "actions.toggle_hidden", mode = "n" },
				["g\\"] = { "actions.toggle_trash", mode = "n" },
			},
			-- Set to false to disable all of the above keymaps
			use_default_keymaps = true,
			view_options = {
				show_hidden = true,
				-- Sort file names with numbers in a more intuitive order for humans.
				-- Can be "fast", true, or false. "fast" will turn it off for large directories.
				natural_order = "fast",
				float = {
					padding = 2,
					max_width = 0,
					max_height = 0,
					border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
					win_options = {
						winblend = 0,
					},
					-- optionally override the oil buffers window title with custom function: fun(winid: integer): string
					get_win_title = nil,
					-- preview_split: Split direction: "auto", "left", "right", "above", "below".
					preview_split = "auto",
				},
				-- Configuration for the file preview window
				preview_win = {
					update_on_cursor_moved = true,
					-- How to open the preview window "load"|"scratch"|"fast_scratch"
					preview_method = "fast_scratch",
				},
				-- Configuration for the floating action confirmation window
				confirmation = {
					max_width = 0.9,
					min_width = { 40, 0.4 },
					max_height = 0.9,
					min_height = { 5, 0.1 },
					border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
					win_options = {
						winblend = 0,
					},
				},
				-- Configuration for the floating progress window
				progress = {
					border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
				},
				-- Configuration for the floating SSH window
				ssh = {
					border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
				},
				-- Configuration for the floating keymaps help window
				keymaps_help = {
					border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
				},
			},
		})
	end,
}

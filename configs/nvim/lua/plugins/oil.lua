return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require("oil")
		local border_square = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
		oil.setup({
			default_file_explorer = true,
			columns = {
				-- "icon",
				"permissions",
				"size",
				-- "mtime",
			},
			delete_to_trash = true,
			watch_for_changes = false,

			view_options = {
				show_hidden = true,
				natural_order = "fast",
				get_win_title = nil,
			},

			keymaps = {
				["g?"] = { "actions.show_help", mode = "n" },
				["<CR>"] = "actions.select",
				["<C-s>"] = { "actions.select", opts = { vertical = true } },
				["<C-h>"] = { "actions.select", opts = { horizontal = true } },
				["<C-t>"] = { "actions.select", opts = { tab = true } },
				["<C-p>"] = "actions.preview",
				["q"] = { "actions.close", mode = "n" },
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
			use_default_keymaps = false,

			float = {
				padding = 2,
				max_width = 55,
				max_height = 15,
				-- border = border_square,
				win_options = {
					winblend = 0,
				},
			},
			preview_win = {
				update_on_cursor_moved = true,
				-- How to open the preview window "load"|"scratch"|"fast_scratch"
				preview_method = "fast_scratch",
			},
			confirmation = {
				max_width = 0.5,
				min_width = { 40, 0.4 },
				max_height = 0.5,
				min_height = { 5, 0.1 },
				-- border = border_square,
				win_options = {
					winblend = 0,
				},
			},
			progress = {
				-- border = border_square,
			},
			ssh = {
				-- border = border_square,
			},
			keymaps_help = {
				-- border = border_square,
			},
		})
		local keymap = require("vim.keymap")
		keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Diagnostics" })
		keymap.set("n", "<leader>e", function()
			oil.toggle_float()
		end, { desc = "Files floating" })
		keymap.set("n", "<leader>E", "<cmd>Oil<CR>", { desc = "Files" })
	end,
}

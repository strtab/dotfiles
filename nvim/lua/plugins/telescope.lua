return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				selection_caret = "  ",
				entry_prefix = "  ",
				initial_mode = "insert",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
						preview_width = 0.65,
					},
					vertical = {
						mirror = false,
					},
					width = 0.7,
					height = 0.75,
					preview_cutoff = 120,
				},
				winblend = 0,
				border = { title = "Results" },
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				color_devicons = true,
			},
		})
		-- set keymaps
		local builtin = require("telescope.builtin")
		local keymap = require("vim.keymap")
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find string" })
		keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
		keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
	end,
}

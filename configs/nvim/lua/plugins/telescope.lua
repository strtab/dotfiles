return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				selection_caret = " ",
				entry_prefix = " ",
				initial_mode = "insert",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
						preview_width = 0.6,
					},
					width = 0.8,
					height = 0.75,
					preview_cutoff = 120,
				},
				winblend = 0,
				--borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			},
		})
		-- set keymaps
		local builtin = require("telescope.builtin")
		local keymap = require("vim.keymap")
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Files" })
		keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Strings" })
		-- keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
		keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Diagnostics" })
		-- keymap.set("n", "<leader>fc", "<cmd>:Telescope git_commits<CR>", { desc = "Commits" })
		keymap.set("n", "<leader>fk", "<cmd>:Telescope keymaps<CR>", { desc = "Keymaps" })
	end,
}

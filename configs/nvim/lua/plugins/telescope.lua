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
						preview_width = 0.64,
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
		keymap.set("n", "<leader>fD", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Find diagnostics" })
		keymap.set("n", "<leader>fh", "<cmd>:Telescope notify<CR>", { desc = "Find notify" })
		keymap.set("n", "<leader>fc", "<cmd>:Telescope git_commits<CR>", { desc = "Find commits" })
		keymap.set("n", "<leader>fk", "<cmd>:Telescope keymaps<CR>", { desc = "Find keymaps" })
	end,
}

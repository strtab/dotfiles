return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local tree = require("nvim-tree")

		tree.setup({
			view = {
				width = 25,
			},
			-- disable window_picker for explorer
			-- to work well with window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			git = {
				ignore = false,
			},
		})

		vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
	end,
}

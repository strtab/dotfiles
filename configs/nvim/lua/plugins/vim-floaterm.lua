return {
	"voldikss/vim-floaterm",
	init = function()
		vim.g.floaterm_width = 0.7
		vim.g.floaterm_height = 0.7
		vim.g.floaterm_position = "center"
	end,
	config = function()
		vim.api.nvim_set_hl(0, "FloatermBorder", { fg = "#2e2e2e", bg = "NONE" })
	end,
	keys = {
		{ "<leader>tt", "<cmd>FloatermToggle<cr>", desc = "Toggle term" },
	},
}

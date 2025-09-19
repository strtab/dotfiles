return {
	"voldikss/vim-floaterm",
	init = function()
		vim.g.floaterm_width = 0.7
		vim.g.floaterm_height = 0.8
		vim.g.floaterm_position = "center"
	end,
	config = function()
		vim.api.nvim_set_hl(0, "FloatermBorder", { fg = "#9893a5", bg = "NONE" })
	end,
	keys = {
		{ "<leader>tt", "<cmd>FloatermToggle<cr>", desc = "Toggle term" },
	},
}

return {
	-- "bluz71/vim-moonfly-colors",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	-- 0 will display no window separators
	-- 	-- 1 will display block separators; this is the default
	-- 	-- 2 will diplay line separators
	-- 	vim.g.moonflyWinSeparator = 2
	-- 	vim.g.moonflyTransparent = true
	--
	-- 	vim.cmd("colorscheme moonfly")
	-- end,

	"rose-pine/neovim",
	config = function()
		vim.g.moonflyWinSeparator = 2
		require("rose-pine").setup({
			variant = "moon", -- auto, main, moon, or dawn
			dim_inactive_windows = false,
			extend_background_behind_borders = false,
			enable = {
				terminal = true,
				legacy_highlights = true,
				migrations = true,
			},
			styles = {
				bold = false,
				italic = true,
				transparency = true,
			},
		})
		vim.cmd("colorscheme rose-pine")
	end,
}

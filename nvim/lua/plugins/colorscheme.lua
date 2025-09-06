return {
	"bluz71/vim-moonfly-colors",
	lazy = false,
	priority = 1000,

	config = function()
		-- 0 will display no window separators
		-- 1 will display block separators; this is the default
		-- 2 will diplay line separators
		vim.g.moonflyWinSeparator = 1

		vim.g.moonflyTransparent = true

		--    require("moonfly").custom_colors({
		--      bg = "#101010",
		--    })
		vim.cmd("colorscheme moonfly")
	end,
}

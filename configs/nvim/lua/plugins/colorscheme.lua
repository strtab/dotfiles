return {
	-- "material_colors",
	dir = "~/.config/nvim/lua/themes/material_colors",
	name = "material_colors",
	lazy = false,
	priority = 1000,
	config = function()
		-- require("quickshell_theme").setup(false)  -- watch = false
		require("themes.material_colors").setup()
	end,
}

-- return {
-- "rose-pine/neovim",
-- config = function()
-- 	vim.g.moonflyWinSeparator = 2
-- 	require("rose-pine").setup({
-- 		variant = "moon", -- auto, main, moon, or dawn
-- 		dim_inactive_windows = false,
-- 		extend_background_behind_borders = false,
-- 		enable = {
-- 			terminal = true,
-- 			legacy_highlights = true,
-- 			migrations = true,
-- 		},
-- 		styles = {
-- 			bold = false,
-- 			italic = true,
-- 			transparency = true,
-- 		},
-- 	})
-- 	vim.cmd("colorscheme rose-pine")
-- end,
-- }

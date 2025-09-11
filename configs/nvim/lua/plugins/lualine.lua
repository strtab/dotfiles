return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local colors = {
			none = "#00000000",
			dark = "101010",
			white = "#f2e9e1",
			gray = "#525252",
			cyan = "#56949f",
			pink = "#d7827e",
			purple = "#907aa9",
			red = "#b4637a",
		}

		local custom_theme = {
			normal = {
				a = { fg = colors.dark, bg = colors.cyan, gui = "bold" },
				b = { fg = colors.gray, bg = colors.none },
				c = { fg = colors.gray, bg = colors.none },
				x = { fg = colors.white, bg = colors.none },
				y = { fg = colors.gray, bg = colors.none },
				z = { fg = colors.white, bg = colors.none },
			},
			insert = {
				a = { fg = colors.dark, bg = colors.pink, gui = "bold" },
				z = { fg = colors.white, bg = colors.none },
			},
			visual = {
				a = { fg = colors.dark, bg = colors.purple, gui = "bold" },
				z = { fg = colors.white, bg = colors.none },
			},
			replace = {
				a = { fg = colors.dark, bg = colors.red, gui = "bold" },
				z = { fg = colors.white, bg = colors.none },
			},
			command = {
				a = { fg = colors.dark, bg = colors.gray, gui = "bold" },
				z = { fg = colors.white, bg = colors.none },
			},
			inactive = {
				z = { fg = colors.white, bg = colors.none },
			},
		}

		local mode_map = {
			["n"] = "NOR",
			["no"] = "NOR",
			["i"] = "INS",
			["ic"] = "BIN",
			["R"] = "REP",
			["v"] = "SEL",
			["V"] = "LIN",
			[""] = "BLK",
			["t"] = "TER",
			["c"] = "CMD",
		}

		local function custom_mode()
			local mode = vim.api.nvim_get_mode().mode
			return mode_map[mode] or mode
		end

		require("lualine").setup({
			options = {
				icons_enabled = false,
				theme = custom_theme,

				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				always_show_tabline = false,
			},
			sections = {
				lualine_a = { custom_mode },
				lualine_b = { "selectioncount" },
				lualine_c = { "diff" },
				lualine_x = {},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}

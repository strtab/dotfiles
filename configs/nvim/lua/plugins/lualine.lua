return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local colors = {
			bg = "#00000000",
			fg = 7,
			gray = 7,
		}

		local custom_theme = {
			normal = {
				a = { fg = colors.fg, bg = colors.bg },
				-- a = { fg = colors.dark, bg = colors.cyan, gui = "bold" },
				b = { fg = colors.gray, bg = colors.bg },
				c = { fg = colors.gray, bg = colors.bg },
				x = { fg = colors.fg, bg = colors.bg },
				y = { fg = colors.gray, bg = colors.bg },
				z = { fg = colors.fg, bg = colors.bg },
			},
			insert = {
				-- a = { fg = colors.dark, bg = colors.pink, gui = "bold" },
			},
			visual = {
				-- a = { fg = colors.dark, bg = colors.purple, gui = "bold" },
			},
			replace = {
				-- a = { fg = colors.dark, bg = colors.red, gui = "bold" },
			},
			command = {
				-- a = { fg = colors.dark, bg = colors.gray, gui = "bold" },
			},
			inactive = {},
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

return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local colors = {
			black = "#00101010",
			black2 = "101010",
			white = "#c6c6c6",
			gray = "#525252",
			green = "#00c15a",
			cyan = "#66d1ff",
			pink = "#ff74b8",
			purple = "#ff74b8",
			red = "#ff7a93",
		}

		local custom_theme = {
			normal = {
				a = { fg = colors.black2, bg = colors.cyan, gui = "bold" },
				b = { fg = colors.white, bg = colors.black },
				c = { fg = colors.gray, bg = colors.black },
				x = { fg = colors.white, bg = colors.black },
				y = { fg = colors.gray, bg = colors.black },
				z = { fg = colors.white, bg = colors.black },
			},
			insert = {
				a = { fg = colors.black2, bg = colors.pink, gui = "bold" },
				z = { fg = colors.white, bg = colors.black },
			},
			visual = {
				a = { fg = colors.black2, bg = colors.purple, gui = "bold" },
				z = { fg = colors.white, bg = colors.black },
			},
			replace = {
				a = { fg = colors.black2, bg = colors.red, gui = "bold" },
				z = { fg = colors.white, bg = colors.black },
			},
			command = {
				a = { fg = colors.black2, bg = colors.gray, gui = "bold" },
				z = { fg = colors.white, bg = colors.black },
			},
			inactive = {
				z = { fg = colors.white, bg = colors.black },
			},
		}

		local mode_map = {
			["n"] = "N",
			["no"] = "NO",
			["v"] = "V",
			["V"] = "VL",
			[""] = "VB",
			["i"] = "**",
			["ic"] = "**",
			["t"] = "SH",
			["R"] = "RE",
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
				lualine_b = { "diff" },
				lualine_c = { "filename", "selectioncount" },
				lualine_x = {},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			--[[                     Available components
    branch (git branch)
    buffers (shows currently available buffers)
    diagnostics (diagnostics count from your preferred source)
    diff (git diff status)
    encoding (file encoding)
    fileformat (file format)
    filename
    filesize
    filetype
    hostname
    location (location in file in line:column format)
    mode (vim mode)
    progress (%progress in file)
    searchcount (number of search matches when hlsearch is active)
    selectioncount (number of selected characters or lines)
    tabs (shows currently available tabs)
    windows (shows currently available windows)
    lsp_status (shows active lsps in the current buffer and a progress spinner) ]]
			--
		})
	end,
}

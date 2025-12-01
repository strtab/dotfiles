return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")
		wk.setup({
			-- false | "classic" | "modern" | "helix"
			preset = "helix",
			notify = false,
			win = {
				-- width = { min = 4, max = 80 },
				-- height = { min = 4, max = 80 },
				-- col = 2,
				-- row = math.huge,
				--border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
				padding = { 1, 1 },
				title = false,
				zindex = 100,
			},
			layout = {
				width = { min = 20 },
				spacing = 3,
			},
			icons = {
				separator = "",
				group = "",
				ellipsis = "…",
				mappings = false,
				colors = true,
			},
			show_help = false,
			show_keys = false,
		})
		wk.register({
			f = {
				name = "Find",
			},
			t = {
				name = "Tabs",
			},
			e = {
				name = "Files",
			},
			o = {
				name = "Obsidian",
			},
		}, { prefix = "<leader>" })
	end,
}

return {
	"folke/which-key.nvim", -- :h which-key
	--event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({
			preset = "helix",
			-- Delay before showing the popup. Can be a number or a function that returns a number.
			delay = function(ctx)
				return ctx.plugin and 0 or 0
			end,
			-- show a warning when issues were detected with your mappings
			notify = false,
			win = {
				width = { min = 0, max = 45 },
				-- height = { min = 4, max = 25 },
				-- col = 0,
				-- row = math.huge,
				border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
				padding = { 1, 2 }, -- extra  padding [top/bottom, right/left]
				title = false,
				zindex = 100,
			},
			layout = {
				width = { min = 20 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
			},
			--- Mappings are sorted using configured sorters and natural sort of the keys
			--- Available sorters:
			--- * local: buffer-local mappings first
			--- * order: order of the items (Used by plugins like marks / registers)
			--- * group: groups last
			--- * alphanum: alpha-numerical first
			--- * mod: special modifier keys last
			--- * manual: the order the mappings were added
			--- * case: lower-case first
			sort = { "manual", "local", "order", "group", "alphanum", "mod" },
			icons = {
				separator = "", -- symbol used between a key and it's label
				group = "", -- symbol prepended to a group
				ellipsis = "…",
				mappings = false,
				colors = true,
			},
			show_help = false, -- show a help message in the command line for using WhichKey
			show_keys = false, -- show the currently pressed key and its label as a message in the command line
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
			w = {
				name = "Window",
				h = { "<C-w>h", "Go left" },
				j = { "<C-w>j", "Go down" },
				k = { "<C-w>k", "Go top " },
				l = { "<C-w>l", "Go right " },
				H = { "<C-w>H", "Move left" },
				J = { "<C-w>J", "Move down" },
				K = { "<C-w>K", "Move top" },
				L = { "<C-w>L", "Move right" },
				o = { "<C-w>o", "Only" },
				q = { "<C-w>q", "Quit" },
				s = { "<C-w>s", "Split horizontal" },
				v = { "<C-w>v", "Split vertically" },
				w = { "<C-w>w", "Switch" },
				T = { "<C-w>T", "Break into tab" },
				["="] = { "<C-w>=", "Balance" },
				["+"] = { "<C-w>+", "Increase height" },
				["-"] = { "<C-w>-", "Decrease height" },
				[">"] = { "<C-w>>", "Increase width" },
				["<"] = { "<C-w><", "Decrease width" },
			},
		}, { prefix = "<leader>" })
	end,
}

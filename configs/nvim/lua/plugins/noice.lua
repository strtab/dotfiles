return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("noice").setup({
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			views = {
				mini = {
					border = {
						padding = { 0, 0 },
					},
					filter_options = {},
				},
			},
			cmdline = {
				enabled = true,
				view = "mini", -- split, vsplit, mini, cmdline, cmdline_popup, confirm, hover
				format = {
					cmdline = { icon = " :" },
					search_down = { icon = " /" },
					search_up = { icon = " /" },
					filter = { icon = " $" },
					lua = { icon = " lua" },
					help = { icon = " ?" },
				},
			},
			messages = {
				enabled = true,
			},
			commands = {
				history = {
					view = "popup",
				},
				all = {
					view = "popup",
				},
			},
			lsp = {
				documentation = {
					view = "hover",
				},
			},
		})
		-- set keymaps
		local keymap = require("vim.keymap")
		keymap.set("n", "<leader>n", "<cmd>Noice dismiss<CR>", { desc = "Dismiss messages" })
	end,
}

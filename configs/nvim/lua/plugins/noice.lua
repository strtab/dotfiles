return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },

	config = function()
		require("noice").setup({
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = true,
			},
			cmdline = {
				enabled = true,
				view = "cmdline", -- mini, cmdline, cmdline_popup, confirm, hover
				format = {
					cmdline = { icon = ":", title = "" },
					search_down = { icon = " /" },
					search_up = { icon = " ?" },
					-- 	filter = { icon = "$" },
					-- 	lua = { icon = "lua", title = "" },
					-- 	help = { icon = "h", title = "" },
				},
			},
			popupmenu = {
				enabled = true,
				kind_icons = false,
			},
			messages = {
				enabled = true,
				view = "notify",
				view_error = "notify",
				view_warn = "notify",
				view_history = "notify",
				view_search = "virtualtext",
			},
			lsp = {
				documentation = {
					view = "hover", -- documentation from lspconfig (key "K" in normal mode)
				},
			},
		})
		-- Set keymaps
		-- vim.keymap.set("n", "<leader>N", "<cmd>Noice dismiss<CR>", { desc = "Dismiss messages" })
	end,
}

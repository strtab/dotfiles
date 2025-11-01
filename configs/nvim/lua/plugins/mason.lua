return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "■",
					package_pending = "▣",
					package_uninstalled = "□",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of lang servers
			ensure_installed = {
				"ansiblels",
				"dockerls",
				"lua_ls",
				"yamlls",
				"bashls",
				"clangd",
				"gopls",
			},
		})

		mason_tool_installer.setup({
			-- list of formatters
			ensure_installed = {
				"clang-format",
				"prettier",
				"stylua",
			},
		})
	end,
}

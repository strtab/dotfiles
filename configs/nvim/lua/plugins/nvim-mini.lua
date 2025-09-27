return {
	"nvim-mini/mini.nvim",
	config = function()
		require("mini.icons").setup({
			enable = false,
		})
		require("mini.comment").setup({
			mappings = {
				-- Toggle comment (like `gcip` - comment inner paragraph) for both
				-- Normal and Visual modes
				comment = "gc",
				-- Toggle comment on current line
				comment_line = "gl",
				-- Toggle comment on visual selection
				comment_visual = "gl",
				-- Define 'comment' textobject (like `dgc` - delete whole comment block)
				-- Works also in Visual mode if mapping differs from `comment_visual`
				textobject = "gc",
			},
		})
		-- require("mini.files").setup({
		-- 	-- don't show icons
		-- 	content = { prefix = function() end },
		-- 	mappings = {
		-- 		close = "q",
		-- 		go_in = "l",
		-- 		go_in_plus = "L",
		-- 		go_out = "h",
		-- 		go_out_plus = "H",
		-- 		mark_goto = "'",
		-- 		mark_set = "m",
		-- 		reset = "<BS>",
		-- 		reveal_cwd = "@",
		-- 		show_help = "g?",
		-- 		synchronize = "=",
		-- 		trim_left = "<",
		-- 		trim_right = ">",
		-- 	},
		--
		-- 	-- General options
		-- 	options = {
		-- 		-- Whether to delete permanently or move into module-specific trash
		-- 		permanent_delete = false,
		-- 		-- Whether to use for editing directories
		-- 		use_as_default_explorer = true,
		-- 	},
		--
		-- 	-- Customization of explorer windows
		-- 	windows = {
		-- 		-- Maximum number of windows to show side by side
		-- 		max_number = 1,
		-- 		-- Whether to show preview of file/directory under cursor
		-- 		preview = false,
		-- 		-- Width of focused window
		-- 		width_focus = 50,
		-- 		-- Width of non-focused window
		-- 		width_nofocus = 15,
		-- 		-- Width of preview window
		-- 		width_preview = 25,
		-- 	},
		-- 	vim.keymap.set(
		-- 		"n",
		-- 		"<leader>e",
		-- 		"<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>",
		-- 		{ desc = "Files" }
		-- 	),
		-- })
	end,
}

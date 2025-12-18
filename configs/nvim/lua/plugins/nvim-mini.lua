return {
	"nvim-mini/mini.nvim",
	config = function()
		require("mini.icons").setup({
			enable = false,
		})
		require("mini.comment").setup({
			mappings = {
				-- Toggle comment on current line
				comment_line = "gl",
				-- Toggle comment on visual selection
				comment_visual = "gl",
			},
		})
	end,
}

return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			background_colour = "#000000",
			fps = 30,
			icons = {
				DEBUG = " Debug",
				ERROR = " Error",
				INFO = " Info",
				TRACE = " Trace",
				WARN = " Warn",
			},
			level = 2,
			minimum_width = 1,
			render = "minimal",
			stages = "fade",
			time_formats = {
				notification = "%T",
				notification_history = "%FT%T",
			},
			timeout = 100,
			top_down = true,
			on_open = function(win)
				if vim.api.nvim_win_is_valid(win) then
					vim.api.nvim_win_set_config(win, {
						border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
					})
				end
			end,
		})
	end,
}

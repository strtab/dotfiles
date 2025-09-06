return {
	"rcarriga/nvim-notify",
	opts = {
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
		minimum_width = 10,
		render = "minimal",
		stages = "fade",
		time_formats = {
			notification = "%T",
			notification_history = "%FT%T",
		},
		timeout = 4000,
		top_down = true,
	},
}

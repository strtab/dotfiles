local M = {}

-- Function to read and parse the quickshell palette
local function load_palette()
	local palette_path = os.getenv("HOME") .. "/.local/state/quickshell/user/generated/terminal/sequences.txt"
	local file = io.open(palette_path, "r")

	if not file then
		error("Could not open palette file: " .. palette_path)
	end

	local content = file:read("*a")
	file:close()

	-- Parse the palette file
	local colors = {}

	-- Match patterns like ]4;0;#$term0 # or ]4;1;#$term1 #
	for index, hex_code in content:gmatch("]4;(%d+);#([%da-fA-F]+)") do
		index = tonumber(index)
		colors[index] = "#" .. hex_code
	end

	-- Also capture term foreground/background colors
	-- Pattern: ]10;#$term7 # (foreground) and ]11;#$term0 # (background)
	for hex_code in content:gmatch("]10;#([%da-fA-F]+)") do
		colors.fg = "#" .. hex_code
	end

	for hex_code in content:gmatch("]11;#([%da-fA-F]+)") do
		colors.bg = "#" .. hex_code
	end

	return colors
end

-- Function to set highlights based on palette
local function apply_highlights(colors)
	local c = colors

	-- Set terminal colors for nvim
	vim.g.terminal_color_0 = c[0] or "#000000"
	vim.g.terminal_color_1 = c[1] or "#ff0000"
	vim.g.terminal_color_2 = c[2] or "#00ff00"
	vim.g.terminal_color_3 = c[3] or "#ffff00"
	vim.g.terminal_color_4 = c[4] or "#0000ff"
	vim.g.terminal_color_5 = c[5] or "#ff00ff"
	vim.g.terminal_color_6 = c[6] or "#00ffff"
	vim.g.terminal_color_7 = c[7] or "#ffffff"
	vim.g.terminal_color_8 = c[8] or "#808080"
	vim.g.terminal_color_9 = c[9] or "#ff8080"
	vim.g.terminal_color_10 = c[10] or "#80ff80"
	vim.g.terminal_color_11 = c[11] or "#ffff80"
	vim.g.terminal_color_12 = c[12] or "#8080ff"
	vim.g.terminal_color_13 = c[13] or "#ff80ff"
	vim.g.terminal_color_14 = c[14] or "#80ffff"
	vim.g.terminal_color_15 = c[15] or "#c0c0c0"

	-- Set background and foreground
	local bg = "#00000000"
	local fg = c.fg or "#ffffff"

	-- Apply basic highlighting groups
	vim.cmd(string.format("highlight Normal guibg=%s guifg=%s", bg, fg))
	vim.cmd(string.format("highlight EndOfBuffer guibg=%s guifg=%s", bg, fg))
	vim.cmd(string.format("highlight LineNr guibg=%s guifg=%s", bg, c[8] or "#808080"))
	vim.cmd(string.format("highlight CursorLineNr guibg=%s guifg=%s", bg, c[11] or "#ffff80"))
	vim.cmd(string.format("highlight CursorLine guibg=%s", bg))
	vim.cmd(string.format("highlight CursorColumn guibg=%s", bg))
	vim.cmd(string.format("highlight SignColumn guibg=%s", bg))
	vim.cmd(string.format("highlight NonText guibg=%s guifg=%s", bg, c[8] or "#808080"))

	-- Floating windows
	vim.cmd(string.format("highlight NormalFloat guibg=%s guifg=%s", bg, fg))
	vim.cmd(string.format("highlight FloatBorder guibg=%s guifg=%s", bg, c[8] or "#808080"))
	vim.cmd(string.format("highlight FloatTitle guibg=%s guifg=%s gui=bold", bg, c[4] or "#0000ff"))

	-- Syntax highlighting groups
	vim.cmd(string.format("highlight String guifg=%s", c[2] or "#00ff00"))
	vim.cmd(string.format("highlight Comment guifg=%s gui=italic", c[8] or "#808080"))
	vim.cmd(string.format("highlight Keyword guifg=%s gui=bold", c[5] or "#ff00ff"))
	vim.cmd(string.format("highlight Function guifg=%s", c[6] or "#00ffff"))
	vim.cmd(string.format("highlight Type guifg=%s", c[3] or "#ffff00"))
	vim.cmd(string.format("highlight Number guifg=%s", c[1] or "#ff0000"))
	vim.cmd(string.format("highlight Constant guifg=%s", c[4] or "#0000ff"))

	-- UI elements
	vim.cmd(string.format("highlight StatusLine guibg=%s guifg=%s", c[4] or "#0000ff", fg))
	vim.cmd(string.format("highlight StatusLineNC guibg=%s guifg=%s", c[8] or "#808080", fg))
	vim.cmd(string.format("highlight VertSplit guibg=%s guifg=%s", bg, c[8] or "#808080"))

	-- Tab Line
	vim.cmd(string.format("highlight TabLineFill guibg=%s guifg=%s", bg, fg))
	vim.cmd(string.format("highlight TabLine guibg=%s guifg=%s", bg, fg))
	vim.cmd(string.format("highlight TabLineSel guibg=%s guifg=%s", bg, fg))

	-- Oil plugin
	vim.cmd(string.format("highlight OilDir guibg=%s guifg=%s", bg, c[6] or "#00ffff"))
	vim.cmd(string.format("highlight OilFile guibg=%s guifg=%s", bg, fg))
	vim.cmd(string.format("highlight OilDirIcon guibg=%s guifg=%s", bg, c[6] or "#00ffff"))

	-- Which-key plugin
	vim.cmd(string.format("highlight WhichKey guibg=%s guifg=%s", bg, c[5] or "#ff00ff"))
	vim.cmd(string.format("highlight WhichKeyGroup guibg=%s guifg=%s", bg, c[4] or "#0000ff"))
	vim.cmd(string.format("highlight WhichKeyDesc guibg=%s guifg=%s", bg, fg))
	vim.cmd(string.format("highlight WhichKeyValue guibg=%s guifg=%s", bg, c[2] or "#00ff00"))
	vim.cmd(string.format("highlight WhichKeySeparator guibg=%s guifg=%s", bg, c[8] or "#808080"))
end

-- Watch for palette file changes and reload theme using libuv
local function setup_watcher()
	local palette_path = os.getenv("HOME") .. "/.local/state/quickshell/user/generated/terminal/sequences.txt"
	local dir_path = vim.fn.fnamemodify(palette_path, ":h")
	local filename = vim.fn.fnamemodify(palette_path, ":t")
	local fs = vim.loop

	-- Create a file watcher for the directory
	local handle = fs.new_fs_event()
	if not handle then
		vim.notify("Failed to create file watcher", vim.log.levels.WARN)
		return
	end

	local last_change = 0

	local function on_change(err, changed_filename, events)
		if err then
			vim.notify("File watcher error: " .. err, vim.log.levels.WARN)
			return
		end

		-- Check if it's our file and debounce rapid changes
		if changed_filename == filename or changed_filename == palette_path then
			local now = vim.loop.now()
			if now - last_change < 100 then
				return
			end
			last_change = now

			-- Reload theme
			vim.schedule(function()
				package.loaded.quickshell_theme = nil
				local palette = load_palette()
				apply_highlights(palette)
				vim.notify("Quickshell theme reloaded", vim.log.levels.INFO)
			end)
		end
	end

	local ok, err_msg = handle:start(dir_path, {}, on_change)
	if not ok then
		vim.notify("Failed to start file watcher: " .. err_msg, vim.log.levels.WARN)
		return
	end

	-- Clean up on exit
	vim.api.nvim_create_autocmd("VimLeavePre", {
		callback = function()
			if handle then
				handle:stop()
				handle:close()
			end
		end,
		group = vim.api.nvim_create_augroup("quickshell_theme_cleanup", { clear = true }),
	})
end

-- Main setup function
function M.setup()
	local palette = load_palette()
	apply_highlights(palette)

	-- Enable watcher by default, unless explicitly disabled
	-- if watch ~= false then
	-- 	setup_watcher()
	-- end
end

return M

local opt = vim.opt

vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#5f5f5f" })
vim.o.winblend = 0

-- Style of default file manager
vim.g.netrw_liststyle = 1

-- Line numbering
opt.relativenumber = true
opt.number = true

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.showtabline = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- Search
opt.smartcase = true
-- opt.ignorecase = true

-- Cursor
opt.cursorline = true
opt.mouse = ""

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- If wayland is available
if os.getenv("WAYLAND_DISPLAY") and vim.fn.executable("wl-copy") == 1 then
	vim.g.clipboard = {
		name = "wl-clipboard",
		copy = {
			["+"] = "wl-copy --foreground --type text/plain",
			["*"] = "wl-copy --foreground --type text/plain",
		},
		paste = {
			["+"] = "wl-paste --no-newline",
			["*"] = "wl-paste --no-newline",
		},
		cache_enabled = 1,
	}
end

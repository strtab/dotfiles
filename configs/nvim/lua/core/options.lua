vim.cmd("let g:netrw_liststyle=3")

local opt = vim.opt

vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#5f5f5f" })
vim.o.winblend = 0

-- line numbering
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.showtabline = 2
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- search
-- opt.ignorecase = true
opt.smartcase = true

-- cursor
opt.cursorline = true

-- clipboard
-- opt.clipboard:append("xclip")

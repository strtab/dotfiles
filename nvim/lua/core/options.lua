vim.cmd("let g:netrw_liststyle=3")

local opt = vim.opt

-- line numbering
opt.relativenumber = false
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- search
-- opt.ignorecase = true
-- opt.smartcase = true

-- cursor
-- opt.cursorline = true

-- clipboard
-- opt.clipboard:append("xclip")

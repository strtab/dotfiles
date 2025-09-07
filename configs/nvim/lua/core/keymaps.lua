vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>", { desc = "Exit from insert mode" })
keymap.set("n", "<leader>w", "<C-w>", { desc = "Window", expr = true })

keymap.set("n", "<leader>N", ":nohl<CR>", { silent = true, desc = "Clear search" })

-- window management --
-- keymap.set("n", "<leader>q", "<cmd>close<CR>", { desc = "Close window" })

-- tabs management --
keymap.set("n", "<leader>to", "<cmd>tabnew %<CR>", { desc = "New tab" })
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Previous tab" })
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Next tab" })

vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>", { desc = "Exit from insert mode" })
keymap.set("n", "<leader>n", ":nohl<CR>", { silent = true, desc = "Clear search" })

-- tabs management --
keymap.set("n", "<leader>tn", "<cmd>tabnew %<CR>", { desc = "New tab" })
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Previous tab" })
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Next tab" })

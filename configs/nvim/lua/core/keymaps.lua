vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>", { desc = "Exit from insert mode" })

keymap.set("n", "<leader>nn", ":nohl<CR>", { desc = "Clear search" })

-- window management --
-- keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
-- keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
-- keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
-- keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- tabs management --
-- keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<leader>to", "<cmd>tabnew %<CR>", { desc = "New tab" })
keymap.set("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Delete tab" })
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Previous tab" })
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Next tab" })

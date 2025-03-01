-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

-- General Keymaps -------------------
--NOTE: Normal Mode Do things without affecting the registers
--
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- use jk to exit insert mode
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })
keymap.set("n", "<leader>qa", ":qa!<CR>", opts)

-- Save contents
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save contents" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select All" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "s\\", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "s-", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- colorView
keymap.set("n", "<Leader>cc", ":ColorizerToggle")

-- Luaファイル内（例: lua/mappings/diffview.lua や init.lua の適当な場所）に記述
keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })
keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>", { desc = "Open DiffviewFileHistory" })

--Lazy
keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Open Lazy" })

-- default
keymap.set("n", "x", '"_x')

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>")
keymap.set("n", "<s-tab>", ":tabprev<Return>")

--NOTE: highlight display
-- ユーザーコマンドの作成
vim.api.nvim_create_user_command("HighlightSearch", function()
	vim.cmd("vnew")
	vim.cmd("put =execute('highlight')")
end, {})

-- キーマッピングの設定例（ノーマルモード）
vim.keymap.set("n", "<leader>hs", ":HighlightSearch<CR>", { desc = "Show highlight groups in a new window" })

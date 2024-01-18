local utils = require("utils")
local map = utils.map

-- Fast saving shortcut
map("n", "<Leader>w", "<cmd>w!<cr>", "Save current buffer")

-- Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map("", "<Space>", "/", "Search")
map("", "<C-Space>", "?", "Backwards search")

-- Disable highlights when <leader><cr> is pressed
map("", "<Leader><cr>", "<cmd>nohlsearch<cr>", "Clear highlights")

-- Swap focus between split windows
map("", "<C-h>", "<C-w>h", "Swap focus to left window")
map("", "<C-j>", "<C-w>j", "Swap focus to below window")
map("", "<C-k>", "<C-w>k", "Swap focus to above window")
map("", "<C-l>", "<C-w>l", "Swap focus to right window")

-- Move a line of text using ALT+[jk]
map("n", "<M-j>", "mz<cmd>m+<cr>`z", "Move current line below")
map("n", "<M-k>", "mz<cmd>m-2<cr>`z", "Move current line above")

-- Navigate diagnostics
map("n", "<Space>e", vim.diagnostic.open_float, "Open diagnostic window")
map("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")
map("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic")
-- TODO: What the fuck is this
map("n", "<Space>q", vim.diagnostic.setloclist, "What the fuck is this")

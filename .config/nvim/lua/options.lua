local o = vim.o
local go = vim.go
local wo = vim.wo

-- Use system clipboard
o.clipboard = "unnamedplus"

-- Allows traversing line breaks with left-right arrow keys
go.whichwrap = "<,>,[,]"

-- Height of command bar
o.cmdheight = 3

-- Ignore case when searching
o.ignorecase = true

-- Add extra margin to the left
wo.foldcolumn = '1'

-- Show the line number column
wo.number = true

-- Show relative numbers in the numbering column instead of absolute
wo.relativenumber = true

-- Highlight current line
wo.cursorline = true

-- Set a Nerd Font compatible font for the terminal
go.guifont = "ttf-noto-nerd"

-- Use spaces instead of tabs
o.expandtab = true
o.softtabstop = 4
o.shiftwidth = 4
o.tabstop = 4

-- Keep minimal number of screen lines visible
wo.scrolloff = 8

-- Faster update time
go.updatetime = 350

-- Color soft width limit
wo.colorcolumn = "80"

-- Enable 24 bit coloring
go.termguicolors = true

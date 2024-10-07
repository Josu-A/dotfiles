local g = vim.g

-- Set map leader to do extra key combinations
g.mapleader = [[\]]
g.maplocalleader = [[\]]

-- Set default language
vim.cmd [[language en_US.UTF-8]]

-- Don't load vim tutor plugin
g.loaded_tutor_mode_plugin = 1

-- Don't load vim netrw plugin
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Don't load vim tohtml plugin
g.loaded_2html_plugin = 1

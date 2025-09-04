-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Numeración
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Syntax Highlight
vim.cmd("syntax enable")
vim.opt.termguicolors = true

-- Cargar plugins
require('plugins')


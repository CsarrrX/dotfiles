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

-- Usar espacios en lugar de tabs
vim.opt.expandtab = true

-- Cada tab equivale a 4 espacios
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- No permitir wrap
vim.o.wrap = false

-- Cargar plugins
require('plugins')


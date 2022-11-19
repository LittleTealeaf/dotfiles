local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

g.mapleader = ';'

opt.smartcase = true
opt.ignorecase = true
opt.wrap = true
opt.mouse = 'a'
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = false
opt.termguicolors = true
opt.cursorline = true

opt.clipboard = 'unnamedplus'

cmd([[
  set relativenumber number
]])

cmd ([[
  colorscheme catppuccin
]])

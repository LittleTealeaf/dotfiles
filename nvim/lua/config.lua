local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

g.mapleader = ';'

g.do_filetype_lua = 1
opt.scrolloff = 15
opt.smartcase = true
opt.ignorecase = true
opt.wrap = true
opt.mouse = 'a'
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = false
opt.termguicolors = true
opt.signcolumn = "yes"
opt.clipboard = 'unnamedplus'

cmd([[
  nnoremap . ;
  nnoremap \ .
  inoremap A+; <C-Bslash>
  set relativenumber number
  command! Q :q
  command! W :w
]])

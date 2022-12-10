local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

g.mapleader = ';'
cmd([[
	nnoremap . ;
	nnoremap \ .
	inoremap A+; <C-Bslash>
]])

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
  set relativenumber number
	command! Q :q
	command! W :w
	command! BD :bufdo bwipeout
	command! NH :noh
]])

-- Neovide Configuration
cmd([[
	let g:neovide_transparency = 0.5
	let g:neovide_hide_mouse_while_typing = v:true
]])


-- TODO add ;w ;q shortcuts
-- Also, could make a "post-plugins" and figure out how to make something run after


local opt = vim.opt
local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

g.mapleader = ';'
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

	if has('nvim-0.4.3') || has('patch-8.2.0750')
		nnoremap <nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
		nnoremap <nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
		inoremap <nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	endif
]])


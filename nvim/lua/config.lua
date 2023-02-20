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
		nnoremap <nowait><expr> <C-Down> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-Down>"
		nnoremap <nowait><expr> <C-Up> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-Up>"
		inoremap <nowait><expr> <C-Down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<C-Down>"
    inoremap <nowait><expr> <C-Up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<C-Up>"
	endif
]])


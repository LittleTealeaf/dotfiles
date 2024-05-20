local opt = vim.opt
local cmd = vim.cmd
local g = vim.g
local o = vim.o


o.sidescroll = 1
o.sidescrolloff = 999
g.mapleader = ';'
g.maplocalleader = ' '
g.do_filetype_lua = 1
opt.scrolloff = 999
opt.smartcase = true
opt.ignorecase = true
opt.wrap = false
opt.breakindent = true
opt.mouse = 'a'
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = false
opt.termguicolors = true
opt.signcolumn = "yes"
opt.fillchars = { eob = " " }
opt.smartindent = true

cmd([[
  nnoremap . ;
  nnoremap \ .
  set relativenumber number
  command! Q :q
  command! W :w
 	inoremap <C-;> <Esc>
 	inoremap <A-i> <Esc>
 	inoremap <A-a> <Esc>
	set conceallevel=1

 	augroup RestoreCursorShapeOnExit
 		autocmd!
		autocmd VimLeave * set guicursor=a:ver10
	augroup END

	augroup TerminalSettings
		autocmd!
		autocmd TermOpen * setlocal nonumber norelativenumber
		autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
	augroup END
]])

vim.diagnostic.config({
	update_in_insert = true,
	float = {
		border = Transparent and "rounded" or "none"
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
	}
})

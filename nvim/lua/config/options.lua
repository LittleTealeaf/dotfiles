local opt = vim.opt
local cmd = vim.cmd
local g = vim.g
local o = vim.o


o.sidescroll = 1
o.sidescrolloff = 999
g.mapleader = ';'
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

 	augroup RestoreCursorShapeOnExit
 		autocmd!
		autocmd VimLeave * set guicursor=a:ver10
	augroup END
]])

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

vim.diagnostic.config({
	-- virtual_text = false,
	update_in_insert = true,
	float = {
		border = "none"
	}
})

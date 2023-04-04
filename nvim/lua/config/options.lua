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

vim.api.nvim_create_user_command('Format', function()
	vim.lsp.buf.format()
end, {})

local map = vim.api.nvim_set_keymap

map("n","<leader>ww","<cmd>w<CR>", {silent=true})
map("n","<leader>wa","<cmd>wa<CR>", {silent=true})


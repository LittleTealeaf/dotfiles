local opt = vim.opt
local cmd = vim.cmd
local g = vim.g
local o = vim.o

-- Options

o.sidescroll = 1
o.sidescrolloff = 999
g.mapleader = ';'
g.maplocalleader = ' '
g.do_filetype_lua = 1
opt.showmode = false
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
opt.shortmess:append("cq")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'

cmd([[
  nnoremap . ;
  nnoremap \ .
  set relativenumber number
  command! Q :q
  command! W :w
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


-- Base Keymaps

vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>", { silent = true, desc = "Write File" })
vim.keymap.set("n", "<leader>wa", "<cmd>wa<CR>", { silent = true, desc = "Write All" })

-- Windows
vim.keymap.set('n', '<leader>wq', '<cmd>q<CR>', { silent = true, desc = "Close Window" })
vim.keymap.set('n', '<leader>wx', '<cmd>split<CR>', { silent = true, desc = "Split" })
vim.keymap.set('n', '<leader>wv', '<cmd>vsplit<CR>', { silent = true, desc = "Vertical Split" })
vim.keymap.set('n', '<leader>wo', '<C-W>o', { silent = true, desc = "Close Other Windows" })

vim.keymap.set('n', '<C-w>b', '<cmd>split<CR>', { silent = true, desc = "Split" })
vim.keymap.set('n', '<C-w><C-b>', '<cmd>split<CR>', { silent = true, desc = "Split" })

local directions = { 'h', 'j', 'k', 'l' }
for _, dir in ipairs(directions) do
	vim.keymap.set('n', '<C-' .. dir .. '>', '<C-w>' .. dir)
end


-- Global Functions
Github = function(name)
	return string.format("https://github.com/%s", name)
end

local opt = vim.opt
local g = vim.g

-- Options


-- o.sidescroll = 1
g.mapleader = ';'
g.maplocalleader = ' '
g.do_filetype_lua = 1
opt.sidescroll = 1
opt.sidescrolloff = 999
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
opt.conceallevel = 1
opt.encoding = 'utf-8'

vim.scriptencoding = 'utf-8'

-- Base Keymaps

vim.keymap.set('n', '.', ';', { remap = false })
vim.keymap.set('n', '\\', '.')


-- Commands
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('W', 'w', {})


-- Write

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


-- Terminals

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("TermSettings", { clear = true }),
	pattern = "*",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { buffer = true })
		vim.keymap.set('t', '<C-Esc>', '<Esc>', { buffer = true })
		vim.cmd('startinsert')
	end
})


-- Quickfix


vim.keymap.set('n', '<leader>to', ':copen<CR>', { desc = "Quickfix", silent = true })
vim.keymap.set('n', '<leader>th', ':cclose<CR>', { desc = "Quickfix", silent = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	group = vim.api.nvim_create_augroup("tea.config.quickfix", { clear = true }),
	callback = function()
		vim.keymap.set('n', 'q', ':cclose<CR>', { buffer = true, silent = true })
	end
})


--- Cursor Restoration
vim.api.nvim_create_autocmd("VimLeave", {
	group = vim.api.nvim_create_augroup("RestoreCursorShapeOnExit", { clear = true }),
	pattern = "*",
	callback = function()
		vim.opt.guicursor = "a:ver10"
	end
})


-- Global Functions
Github = function(name)
	return string.format("https://github.com/%s", name)
end

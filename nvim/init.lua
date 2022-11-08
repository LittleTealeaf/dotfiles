vim.opt.number = true

vim.opt.mouse = 'a'


vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.wrap = true
vim.opt.hlsearch = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.cmd('set relativenumber number')

-- Leader
vim.g.mapleader = ' '

-- Plugins

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then 
	print('Installing packer...')
	local packer_url = 'https://github.com/wbthomason/packer.nvim'
	vim.fn.system({'git','clone','--depth','1',packer_url,install_path})
	print("Done.")

	vim.cmd('packadd packer.nvim')
	install_plugins = true
end

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'nvim-lualine/lualine.nvim'

	use {'neoclide/coc.nvim', branch = 'release' }

	use 'jiangmiao/auto-pairs'

	use 'preservim/nerdtree'

	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'

	use {"catppuccin/nvim", as = "catppuccin"}

	if install_plugins then
		require('packer').sync()
	end
end)


if install_plugins then
	return
end

-- nvimtree

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- nerdtree configuration

vim.cmd([[
	" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
]])

-- Other Configuration

require("catppuccin").setup({
	flavor = "mocha",
	transparent_background = true
})

vim.cmd("colorscheme catppuccin-mocha")


vim.opt.termguicolors = true

vim.g.clipboard = 'unamedplus'
vim.cmd("hi normal guibg=000000")
vim.cmd("nmap <silent> <leader>t :NERDTreeTabsToggle<CR>")
-- vim.cmd("set guicursor=")

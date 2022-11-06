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

	use 'joshdick/onedark.vim'

	use 'nvim-lualine/lualine.nvim'

	if install_plugins then
		require('packer').sync()
	end
end)


if install_plugins then
	return
end

-- Restore cursor on close
vim.cmd([[
	autocmd VimLeave * jcall system('printf "\e[5 q" > $TTY')
]])

-- Onedark remove background in terminals

vim.cmd([[
	if (has("autocmd") && !has("gui_running"))
		augroup colorset
			autocmd!
			let s:white = {"gui": "#ABB2BF", "cterm": "145", "cterm16": "7" }
			autocmd ColorScheme * call onedark#set_highlight("Normal",{ "fg": s:white })

		augroup END
	endif
]])

-- Other Configuration

vim.opt.termguicolors = true
vim.cmd('colorscheme onedark')

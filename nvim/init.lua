local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('config')

local config = {
	{
		import = "plugins"
	}
}

local options = {
	ui = {
		border = "single"
	},
	change_detection = {
		enabled = true,
		notify = false
	},
	install = {
		colorscheme = { 'catppuccin' }
	}
}

require('lazy').setup(config, options)


vim.cmd([[colorscheme catppuccin]])

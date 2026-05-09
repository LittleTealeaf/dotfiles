local function github(repo)
	return string.format("https://github.com/%s", repo)
end

vim.pack.add({
	github('catppuccin/nvim'),
	github('stevearc/oil.nvim'),
	github('nvim-tree/nvim-web-devicons'),
	-- Folke Plugins
	github('folke/trouble.nvim'),
})

require('plugins.catppuccin')
require('plugins.trouble')
require('plugins.oil')



vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.pack.add({
			github('lewis6991/gitsigns.nvim'),
			github('folke/snacks.nvim'),
			github('nvim-treesitter/nvim-treesitter'),
			github('mrcjkb/rustaceanvim'),
			github('nvim-lualine/lualine.nvim'),
			github('jghauser/mkdir.nvim'),
			github('sitiom/nvim-numbertoggle'),
			github('folke/flash.nvim'),
			github('windwp/nvim-autopairs')
		})

		require('gitsigns').setup()
		require('nvim-autopairs').setup()
		require('plugins.snacks')
		require('plugins.lualine')
		require('plugins.rustaceanvim')
		require('plugins.flash')

		vim.api.nvim_create_autocmd('FileType', {
			pattern = { '<filetype>' },
			callback = function() vim.treesitter.start() end,
		})
	end
})

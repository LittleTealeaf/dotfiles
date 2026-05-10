vim.pack.add({
	Github('catppuccin/nvim'),
	Github('stevearc/oil.nvim'),
	Github('nvim-tree/nvim-web-devicons'),
	Github('folke/trouble.nvim'),
})

require('plugins.catppuccin')
require('plugins.trouble')
require('plugins.oil')



vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.pack.add({
			Github('lewis6991/gitsigns.nvim'),
			Github('folke/snacks.nvim'),
			Github('nvim-treesitter/nvim-treesitter'),
			Github('nvim-treesitter/nvim-treesitter-textobjects'),
			Github('mrcjkb/rustaceanvim'),
			Github('nvim-lualine/lualine.nvim'),
			Github('jghauser/mkdir.nvim'),
			Github('sitiom/nvim-numbertoggle'),
			Github('folke/flash.nvim'),
			Github('windwp/nvim-autopairs'),
			Github('windwp/nvim-ts-autotag'),
			Github('folke/which-key.nvim'),
		})

		require('gitsigns').setup()
		require('nvim-autopairs').setup()
		require('plugins.snacks')
		require('plugins.lualine')
		require('plugins.treesitter')
		require('plugins.rustaceanvim')
		require('plugins.flash')
		require('which-key').setup()
	end
})

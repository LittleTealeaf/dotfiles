Scrollback = os.getenv('KITTY_SCROLLBACK_NVIM') == 'true'
Transparent = (os.getenv("NVIM_TRANSPARENT") or "1") == "1"
BorderedWindows = (os.getenv("NVIM_BORDERED_WINDOWS") or "0") == "1"
Nightly = vim.version().api_prerelease


vim.pack.add({
	Github('nvim-tree/nvim-web-devicons'),
})

require('core')
require('colorscheme')
require('lsp')
require('lsp.autocomplete')
require('ui.oil')

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup('ConfigVimEnter', {}),
	callback = function()
		require('ui.trouble')
		require('ui.lualine')
		require('lsp.dap')
		require('lsp.treesitter')
		require('plugins.snacks')

		vim.pack.add({
			Github('lewis6991/gitsigns.nvim'),
			Github('windwp/nvim-autopairs'),
			Github('windwp/nvim-ts-autotag'),
			Github('jghauser/mkdir.nvim'),
			Github('sitiom/nvim-numbertoggle'),
			Github('folke/which-key.nvim'),
		})

		require('gitsigns').setup()
		require('nvim-autopairs').setup()
		require('which-key').setup()
	end
})

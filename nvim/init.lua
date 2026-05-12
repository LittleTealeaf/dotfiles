Scrollback = os.getenv('KITTY_SCROLLBACK_NVIM') == 'true'
Transparent = (os.getenv("NVIM_TRANSPARENT") or "1") == "1"
BorderedWindows = (os.getenv("NVIM_BORDERED_WINDOWS") or "0") == "1"
Nightly = vim.version().api_prerelease


require('core')

vim.pack.add({
	Github('nvim-tree/nvim-web-devicons'),
})

if vim.g.neovide then
	require('neovide')
	Transparent = false
end


require('colorscheme')

if Scrollback then
	require('scrollback')
	return
end

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
		require('plugins.rustaceanvim')
		require('plugins.flash')

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

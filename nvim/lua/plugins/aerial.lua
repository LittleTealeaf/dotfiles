return {
	'stevearc/aerial.nvim',
	config = function()
		require('aerial').setup({
			backends = { 'treesitter', 'markdown', 'man' }
		})
	end
}

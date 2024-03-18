return {
	{
		'folke/neodev.nvim',
		dependencies = {
			{ 'hrsh7th/nvim-cmp' },
		},
		cond = vim.g.features.lsp,
		opts = {
			override = function(root_dir, options)
				if root_dir == os.getenv('DOT_FILES') .. '/nvim' then
					options.enabled = true
					options.plugins = true
				end
			end,
			path_strict = true,
		}
	}
}

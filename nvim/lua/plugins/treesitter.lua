return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		{ 'nvim-treesitter/nvim-treesitter-textobjects' },
		{
			'windwp/nvim-ts-autotag',
			config = true,
		},
	},
	cond = vim.g.features.treesitter,
	build = function()
		require('nvim-treesitter.install').update({ with_sync = true })
	end,
	config = function()
		local configs = require('nvim-treesitter.configs')

		configs.setup({
			autotag = {
				enabled = true,
				enable_close_on_slash = false,
			},
			ensure_installed = "all",
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						['ia'] = '@assignment.inner',
						['aa'] = '@assignment.outer',
						['iA'] = '@attribute.inner',
						['aA'] = '@attribute.outer',
						['ib'] = '@block.inner',
						['ab'] = '@block.outer',
						['iC'] = '@call.inner',
						['aC'] = '@call.outer',
						['ic'] = '@class.inner',
						['ac'] = '@class.outer',
						['i3'] = '@comment.inner',
						['a3'] = '@comment.outer',
						['ii'] = '@conditional.linner',
						['ai'] = '@conditional.outer',
						['iF'] = '@frame.inner',
						['aF'] = '@frame.outer',
						['if'] = '@function.inner',
						['af'] = '@function.outer',
						['il'] = '@loop.inner',
						['al'] = '@loop.outer',
						['in'] = '@number.inner',
						['iP'] = '@parameter.inner',
						['aP'] = '@parameter.outer',
						['ir'] = '@regex.inner',
						['ar'] = '@regex.outer',
						['is'] = '@scopename.inner',
						['as'] = '@statement.outer',
					}
				}
			}
		})
	end
}

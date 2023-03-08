local treeclimber_movement = function(fun)
	return function()
		require('tree-climber')[fun]({
			skip_comments = true,
			highlight = true,
			timeout = 300,
			higroup = 'Search'
		})
	end
end


return {
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
			'nvim-treesitter/nvim-treesitter-context',
		},
		build = ":TSUpdate",
		config = function()
			require('nvim-treesitter.configs').setup({
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
				},
				ensure_installed = {
					'lua',
					'javascript',
					'java',
					'html',
					'css',
					'scss',
					'python',
					'markdown',
					'gitignore',
					'gitcommit',
					'bash',
					'c',
					'json',
					'rust',
					'vim',
					'help',
					"markdown_inline",
				}
			})

			require('treesitter-context').setup({
				mode = 'topline',
				--separator = '-'
			})
		end,
	},
	{
		'drybalka/tree-climber.nvim',
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
		},
		lazy = true,
		keys = {
			{
				'<C-h>',
				treeclimber_movement('goto_parent'),
				mode = { 'n', 'v', 'o' },
				desc = "Goto Parent"
			},
			{
				'<C-l>',
				treeclimber_movement('goto_child'),
				mode = { 'n', 'v', 'o' },
				desc = "Goto Child"
			},
			{
				'<C-j>',
				treeclimber_movement('goto_next'),
				mode = { 'n', 'v', 'o' },
				desc = "Goto next"
			},
			{
				'<C-k>',
				treeclimber_movement('goto_prev'),
				mode = { 'n', 'v', 'o' },
				desc = "Goto Previous"
			},
			{
				'<C-b>',
				function() require('tree-climber').select_node() end,
				mode = { 'n', 'o' },
				desc = "Select Node"
			},
			{
				'<C-n>',
				function() require('tree-climber').highlight_node() end,
				mode = { 'n' },
				desc = "Highlight Node"
			}
		}
	}
}

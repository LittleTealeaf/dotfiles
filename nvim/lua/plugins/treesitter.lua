local function treeclimber_action(fun)
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
			{ 'nvim-treesitter/nvim-treesitter-textobjects' },
			{
				'windwp/nvim-ts-autotag',
				config = true,
			},
		},
		build = function()
			require('nvim-treesitter.install').update({ with_sync = true })
		end,
		config = function()
			require('nvim-treesitter.configs').setup({
				autotag = {
					enabled = true,
					enable_close_on_slash = false,
				},
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
				ensure_installed = "all"
			})
		end,
	},
	{
		'drybalka/tree-climber.nvim',
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
		},
		enabled = false,
		lazy = true,
		keys = {
			{
				'<C-h>',
				treeclimber_action('goto_parent'),
				mode = { 'n', 'v', 'o' },
				desc = "Goto Parent"
			},
			{
				'<C-l>',
				treeclimber_action('goto_child'),
				mode = { 'n', 'v', 'o' },
				desc = "Goto Child"
			},
			{
				'<C-j>',
				treeclimber_action('goto_next'),
				mode = { 'n', 'v', 'o' },
				desc = "Goto next"
			},
			{
				'<C-k>',
				treeclimber_action('goto_prev'),
				mode = { 'n', 'v', 'o' },
				desc = "Goto Previous"
			},
			{
				'<C-b>',
				treeclimber_action('select_node'),
				mode = { 'n', 'o' },
				desc = "Select Node"
			},
			{
				'<C-n>',
				treeclimber_action('highlight_node'),
				mode = { 'n' },
				desc = "Highlight Node"
			},
		}
	}
}

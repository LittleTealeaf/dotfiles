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
		config = function()
			local treeclimber = require('tree-climber')
			local setkey = vim.keymap.set

			local keyopts = { silent = true }

			local conf_goto = function(fun)
				return function()
					fun({
						skip_comments = true,
						highlight = true,
						timeout = 300,
						higroup = 'Search'
					})
				end
			end

			setkey({ 'n', 'v', 'o' }, '<C-h>', conf_goto(treeclimber.goto_parent), keyopts)
			setkey({ 'n', 'v', 'o' }, '<C-l>', conf_goto(treeclimber.goto_child), keyopts)
			setkey({ 'n', 'v', 'o' }, '<C-j>', conf_goto(treeclimber.goto_next), keyopts)
			setkey({ 'n', 'v', 'o' }, '<C-k>', conf_goto(treeclimber.goto_prev), keyopts)
			setkey({ 'n', 'o' }, '<C-b>', treeclimber.select_node, keyopts)
			setkey({ 'n' }, '<C-n>', treeclimber.highlight_node, keyopts)
		end,
		lazy = true,
		keys = {
			'<C-h>', '<C-l>', '<C-j>', '<C-k>', '<C-b>', '<C-n>'
		}
	}
}

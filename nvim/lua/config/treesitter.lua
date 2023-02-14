require('nvim-treesitter.configs').setup({
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {

				['in'] = '@number.inner',
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['aF'] = '@frame.outer',
				['iF'] = '@frame.inner',
				['aa'] = '@assignment.outer',
				['ia'] = '@assignment.inner',
				['ab'] = '@block.inner',
				['ib'] = '@block.outer',
				['as'] = '@statement.outer',
				['ic'] = '@class.inner',
				['ac'] = '@class.outer',
				['iC'] = '@call.inner',
				['aC'] = '@call.outer',
				['is'] = '@scopename.inner',
				['al'] = '@loop.outer',
				['il'] = '@loop.inner',

				-- ['af'] = '@function.outer',
				-- ['if'] = '@function.inner',
				-- ['ac'] = '@class.outer',
				-- ['ic'] = '@class.inner',
				-- ['al'] = '@loop.around',
				-- ['il'] = '@loop.inner',
				-- ['ia'] = '@assignment.inner',
				-- ['aa'] = '@assignment.outer',
				-- ['ai'] = '@conditional.outer',
				-- ['ii'] = '@conditional.inner',
				-- ['in'] = '@number.inner',
				-- ['ao'] = '@parameter.outer',
				-- ['io'] = '@parameter.inner',
				-- ['ab'] = '@block.outer',
				-- ['ib'] = '@block.inner'
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
		'help'
	}
})


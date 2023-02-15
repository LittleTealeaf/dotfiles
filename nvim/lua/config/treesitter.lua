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
		'help'
	}
})


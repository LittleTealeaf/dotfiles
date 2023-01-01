require('nvim-treesitter.install').prefer_git = true
require('nvim-treesitter.configs').setup({
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
	}
})



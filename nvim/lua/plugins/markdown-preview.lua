return {
	'iamcco/markdown-preview.nvim',
	build = 'cd app && npm install',
	ft = { 'markdown', 'md' },
	init = function()
		vim.g.mkdp_theme = 'dark'
	end
}

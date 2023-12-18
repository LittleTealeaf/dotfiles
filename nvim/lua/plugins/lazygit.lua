return {
	'yorik1984/lazygit.nvim',
	cmd = { 'LazyGit' },
	keys = {
		{
			'<leader>gl',
			function()
				local lazygit = require('lazygit')
				lazygit.lazygit()
				vim.keymap.del('t', '<esc>', { buffer = 0 })
			end
		}
	}
}

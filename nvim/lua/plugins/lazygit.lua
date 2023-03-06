return {
	'kdheepak/lazygit.nvim',
	lazy = true,
	keys = { '<leader>gl' },
	config = function()
		local setkey = vim.keymap.set

		setkey('n', '<leader>gl', ':LazyGit<CR>', { silent = true })
	end
}

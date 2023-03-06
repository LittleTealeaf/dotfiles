return {
	'kdheepak/lazygit.nvim',
	config = function()
		local setkey = vim.keymap.set

		setkey('n', '<leader>gl', ':LazyGit<CR>', { silent = true })
	end
}

return {
	'numToStr/Comment.nvim',
	event = 'BufEnter',
	config = function()
		require("Comment").setup({
			mappings = {
				baisc = true,
				extra = true
			}
		})
	end
}

return {
	'numToStr/Comment.nvim',
	config = function()
		require("Comment").setup({
			mappings = {
				baisc = true,
				extra = true
			}
		})
	end
}

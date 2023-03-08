return {
	{
		'windwp/nvim-autopairs',
		dependencies = {
			{
				'hrsh7th/nvim-cmp',
				name = 'cmp',
			}
		},
		config = function()
			require('nvim-autopairs').setup()

			require('cmp').event:on(
				'confirm_done',
				require('nvim-autopairs.completion.cmp').on_confirm_done()
			)
		end
	},
	{
		'windwp/nvim-ts-autotag',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		config = true,
	},
	{
		'numToStr/Comment.nvim',
		event = 'VeryLazy',
		opts = {
			mappings = {
				basic = true,
				extra = true
			}
		}
	}
}

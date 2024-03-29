return {
	'windwp/nvim-autopairs',
	dependencies = {
		{ 'hrsh7th/nvim-cmp', }
	},
	event = "InsertEnter",
	config = function()
		require('nvim-autopairs').setup()

		require('cmp').event:on(
			'confirm_done',
			require('nvim-autopairs.completion.cmp').on_confirm_done()
		)
	end,
}

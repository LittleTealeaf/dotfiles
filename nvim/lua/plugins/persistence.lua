return {
	'folke/persistence.nvim',
	event = 'BufReadPre',
	name = 'persistence',
	config = true,
	keys = {
		{
			'<leader>ql',
			function()
				require('persistence').load()
			end,
			desc = 'Load last session in this directory'
		},
		{
			'<leader>qs',
			function ()
				require('persistence').load({last = true})
			end,
			desc = 'Load Last Session'
		}
	}
}

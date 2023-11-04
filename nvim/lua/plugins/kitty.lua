return {
	{
		'mikesmithgh/kitty-scrollback.nvim',
		enabled = os.getenv('TERM') == 'xterm-kitty',
		lazy = true,
		cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
		event = { 'User KittyScrollbackLaunch' },
		config = function ()
			require('kitty-scrollback').setup()
		end,
	}
}

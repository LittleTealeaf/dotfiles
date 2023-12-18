local function config(opts)
	return function()
		vim.keymap.set({ 'n' }, '<esc>', '<Plug>(KsbCloseOrQuitAll)', {})
		vim.keymap.set({ 'n' }, '<M-q>', '<Plug>(KsbCloseOrQuitAll)', {})
		return opts
	end
end

return {
	{
		'mikesmithgh/kitty-scrollback.nvim',
		enabled = true,
		lazy = true,
		cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
		event = { 'User KittyScrollbackLaunch' },
		config = function()
			require('kitty-scrollback').setup({
				['tealeaf_base'] = config({
					kitty_get_text = {
						extent = 'all',
						ansi = true
					},
				}),
				['tealeaf_last_cmd'] = config({
					kitty_get_text = {
						extent = 'last_cmd_output',
						ansi = true
					},
				})
			})
		end,
	}
}

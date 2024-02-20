local function config(opts)
	return function()
		vim.opt.scrolloff = 1
		vim.o.sidescrolloff = 1
		vim.keymap.set({ 'n' }, '<esc>', '<Plug>(KsbCloseOrQuitAll)', {})
		vim.keymap.set({ 'n' }, '<M-q>', '<Plug>(KsbCloseOrQuitAll)', {})
		return opts
	end
end

-- TODO: https://github.com/mikesmithgh/kitty-scrollback.nvim?tab=readme-ov-file#user-configuration
-- (This will get rid of the need to certain flags on launch)

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
				['tealeaf_screen'] = config({
					kitty_get_text = {
						extent = 'screen',
						ansi = true
					}
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

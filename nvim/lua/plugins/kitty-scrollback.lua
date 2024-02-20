local function config(opts)
	return function()
		vim.opt.scrolloff = 1
		vim.o.sidescrolloff = 1
		vim.keymap.set({ 'n' }, '<esc>', '<Plug>(KsbCloseOrQuitAll)', {})
		vim.keymap.set({ 'n' }, '<M-q>', '<Plug>(KsbCloseOrQuitAll)', {})
		vim.keymap.set({ 'n' }, '<c-y>', function()
			require('kitty-scrollback.windows').open_paste_window()
		end, {})


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
				}),
				['tealeaf_cmd'] = config({
					kitty_get_text = {
						extent = 'all',
						ansi = true
					},
					callbacks = {
						after_ready = function()
							vim.api.nvim_win_set_cursor(0, { vim.fn.line('.'), 0 })
							require('kitty-scrollback.windows').open_paste_window()
						end
					}
				})
			})
		end,
	}
}

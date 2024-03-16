return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = {
		{ 'nvim-lua/plenary.nvim' }
	},
	config = function()
		local harpoon = require('harpoon')
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			}
		})

		vim.keymap.set('n', '<leader>bt', function() harpoon:list():append() end, { desc = "Harpoon File" })
		vim.keymap.set('n', '<leader>bg', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
			{ desc = "Toggle Harpoon Menu" })

		local keys = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 }

		for index, value in ipairs(keys) do
			vim.keymap.set('n', '<A-' .. value .. '>', function() harpoon:list():select(index) end,
				{ desc = "Harpoon File " .. value })
		end
	end,
}

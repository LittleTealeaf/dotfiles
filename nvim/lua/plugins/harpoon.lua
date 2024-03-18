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
		vim.keymap.set('n', '<leader>bg', function()
			harpoon.ui:toggle_quick_menu(harpoon:list(), {
				ui_width_ratio = 0.5
			})
		end, { desc = "Toggle Harpoon Menu" })

		local keys = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 }

		for index, value in ipairs(keys) do
			vim.keymap.set('n', '<A-' .. value .. '>', function() harpoon:list():select(index) end,
				{ desc = "Harpoon File " .. value })
		end

		vim.keymap.set('n', '<M-[>', function() harpoon:list():prev() end, { desc = "Harpoon Previous" })
		vim.keymap.set('n', '<M-]>', function() harpoon:list():next() end, { desc = "Harpoon Next" })


		harpoon:extend({
			UI_CREATE = function(cx)
				local opts = { buffer = cx.buffer }
				vim.keymap.set('n', '<C-v>', function() harpoon.ui:select_menu_item({ vsplit = true }) end, opts)
				vim.keymap.set('n', '<C-x>', function() harpoon.ui:select_menu_item({ split = true }) end, opts)
			end
		})
	end,
}

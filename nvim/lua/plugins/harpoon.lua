return {
	'ThePrimeagen/harpoon',
	dependnecies = {
		{ 'nvim-lua/plenary.nvim' },
	},
	config = function()
		local harpoon = require('harpoon')
		local ui = require('harpoon.ui')
		local mark = require('harpoon.mark')

		harpoon.setup({
			menu = {
				width = 100
			}
		})

		vim.keymap.set('n', '<leader>bt', mark.add_file, { desc = "Harpoon File" })
		vim.keymap.set('n', '<leader>bg', ui.toggle_quick_menu, { desc = "Toggle Harpoon Menu" })
		vim.keymap.set('n', '<A-]>', ui.nav_next, { desc = "Next Harpoon File" })
		vim.keymap.set('n', '<A-[>', ui.nav_prev, { desc = "Prevous Harpoon File" })
		vim.keymap.set('n', '<A-1>', function() ui.nav_file(1) end, { desc = "Harpoon File 1" })
		vim.keymap.set('n', '<A-2>', function() ui.nav_file(2) end, { desc = "Harpoon File 2" })
		vim.keymap.set('n', '<A-3>', function() ui.nav_file(3) end, { desc = "Harpoon File 3" })
		vim.keymap.set('n', '<A-4>', function() ui.nav_file(4) end, { desc = "Harpoon File 4" })
		vim.keymap.set('n', '<A-5>', function() ui.nav_file(5) end, { desc = "Harpoon File 5" })
		vim.keymap.set('n', '<A-6>', function() ui.nav_file(6) end, { desc = "Harpoon File 6" })
		vim.keymap.set('n', '<A-7>', function() ui.nav_file(7) end, { desc = "Harpoon File 7" })
		vim.keymap.set('n', '<A-8>', function() ui.nav_file(8) end, { desc = "Harpoon File 8" })
		vim.keymap.set('n', '<A-9>', function() ui.nav_file(9) end, { desc = "Harpoon File 9" })
		vim.keymap.set('n', '<A-0>', function() ui.nav_file(10) end, { desc = "Harpoon File 10" })
	end,
	keys = {
		{ '<leader>bt', desc = "Harpoon File" },
		{ '<leader>bg', desc = "Toggle Harpoon Menu" },
		{ '<A-]>',      desc = "Next Harpoon File" },
		{ '<A-[>',      desc = "Prev Harpoon File" },
		{ '<A-1>',      desc = "Harpoon File 1" },
		{ '<A-2>',      desc = "Harpoon File 2" },
		{ '<A-3>',      desc = "Harpoon File 3" },
		{ '<A-4>',      desc = "Harpoon File 4" },
		{ '<A-5>',      desc = "Harpoon File 5" },
		{ '<A-6>',      desc = "Harpoon File 6" },
		{ '<A-7>',      desc = "Harpoon File 7" },
		{ '<A-8>',      desc = "Harpoon File 8" },
		{ '<A-9>',      desc = "Harpoon File 9" },
		{ '<A-0>',      desc = "Harpoon File 10" },
	}
}

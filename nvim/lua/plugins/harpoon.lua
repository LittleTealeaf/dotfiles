return {
	'ThePrimeagen/harpoon',
	dependnecies = {
		{ 'nvim-lua/plenary.nvim' },
	},
	opts = {
		menu = {
			width = 100
		}
	},
	keys = {
		{ '<leader>bt', function() require("harpoon.mark").add_file() end,        desc = "Mark File in Harpoon" },
		{ '<leader>bg', function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle Harpoon Quick Menu" },
		{ '<A-S-]>',    function() require('harpoon.ui').nav_next() end,          desc = "Next Harpoon File" },
		{ '<A-S-[>',    function() require('harpoon.ui').nav_prev() end,          desc = "Next Harpoon File" },
		{ '<A-1>',      function() require('harpoon.ui').nav_file(1) end,         desc = "Harpooned File 1" },
		{ '<A-2>',      function() require('harpoon.ui').nav_file(2) end,         desc = "Harpooned File 2" },
		{ '<A-3>',      function() require('harpoon.ui').nav_file(3) end,         desc = "Harpooned File 3" },
		{ '<A-4>',      function() require('harpoon.ui').nav_file(4) end,         desc = "Harpooned File 4" },
		{ '<A-5>',      function() require('harpoon.ui').nav_file(5) end,         desc = "Harpooned File 5" },
		{ '<A-6>',      function() require('harpoon.ui').nav_file(6) end,         desc = "Harpooned File 6" },
		{ '<A-7>',      function() require('harpoon.ui').nav_file(7) end,         desc = "Harpooned File 7" },
		{ '<A-8>',      function() require('harpoon.ui').nav_file(8) end,         desc = "Harpooned File 8" },
		{ '<A-9>',      function() require('harpoon.ui').nav_file(9) end,         desc = "Harpooned File 9" },
		{ '<A-0>',      function() require('harpoon.ui').nav_file(10) end,        desc = "Harpooned File 10" },
	}
}

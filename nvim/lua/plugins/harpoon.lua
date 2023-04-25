return {
	'ThePrimeagen/harpoon',
	dependnecies = {
		'nvim-lua/plenary.nvim',
	},
	keys = {
		{ '<leader>bh', function() require("harpoon.mark").add_file() end,        desc = "Mark File in Harpoon" },
		{ '<leader>bg', function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle Harpoon Quick Menu" },
		-- { '<M-{>',      function() require('harpoon.ui').nav_prev() end,          desc =
		-- "Navigate to Previous Harpooned File" },
		-- { '<M-}>',      function() require('harpoon.ui').nav_next() end,          desc = "Navigate to Next Harpooned File" }
	}
}

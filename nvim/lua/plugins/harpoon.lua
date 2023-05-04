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
		{ '<leader>bh', function() require("harpoon.mark").add_file() end,        desc = "Mark File in Harpoon" },
		{ '<leader>bt', function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle Harpoon Quick Menu" },
	}
}

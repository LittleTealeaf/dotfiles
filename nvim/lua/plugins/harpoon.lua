local function nav_file(index)
	return function ()
		require('harpoon.ui').nav_file(index)
	end
end

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
		{ '<A-S-]>',      function() require('harpoon.ui').nav_next() end,          desc = "Next Harpoon File" },
		{ '<A-S-[>',     function() require('harpoon.ui').nav_prev() end,          desc = "Next Harpoon File" },
		{'<A-1>', nav_file(1), desc = "Harpooned File 1"},
		{'<A-2>', nav_file(2), desc = "Harpooned File 2"},
		{'<A-3>', nav_file(3), desc = "Harpooned File 3"},
		{'<A-4>', nav_file(4), desc = "Harpooned File 4"},
		{'<A-5>', nav_file(5), desc = "Harpooned File 5"},
		{'<A-6>', nav_file(6), desc = "Harpooned File 6"},
		{'<A-7>', nav_file(7), desc = "Harpooned File 7"},
		{'<A-8>', nav_file(8), desc = "Harpooned File 8"},
		{'<A-9>', nav_file(9), desc = "Harpooned File 9"},
		{'<A-0>', nav_file(10), desc = "Harpooned File 10"},
	}
}

vim.pack.add({
	'https://github.com/folke/flash.nvim',
	'https://github.com/folke/which-key.nvim'
})


local flash = require('flash')

flash.setup({
	modes = {
		char = {
			jump_labels = false,
			char_actions = function(motion)
				return {
					['.'] = "next",
					[','] = "prev",
					[motion:lower()] = "next",
					[motion:upper()] = "prev",
				}
			end
		}
	}
})

local wk = require("which-key")

wk.add({
	{ "<c-s>", function() require('flash').toggle() end,            desc = "Toggle Flash Search", mode = "c" },
	{ "<a-/>", function() require('flash').treesitter_search() end, desc = "Treesitter Search",   mode = { "n", "x", "o" } },
	{ "s",     function() require('flash').treesitter() end,        desc = "Treesitter",          mode = "x" },
	{ "<c-/>", function() require('flash').jump() end,              desc = "Flash",               mode = { "n", "x", "o" } },
})

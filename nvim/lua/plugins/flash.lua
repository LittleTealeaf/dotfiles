vim.pack.add({ Github('folke/flash.nvim') })
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


vim.keymap.set("c", "<c-s>", function() flash.toggle() end, { desc = "Toggle Flash Search" })
vim.keymap.set({ "n", "x", "o" }, "<a-/>", function() flash.treesitter_search() end,
	{ desc = "Treesitter Search" })
vim.keymap.set("x", "s", function() flash.treesitter() end, { desc = "Treesitter" })
vim.keymap.set({ "n", "x", "o" }, "<c-/>", function() flash.jump() end, { desc = "Flash" })

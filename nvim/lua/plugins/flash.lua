return {
	{
		'folke/flash.nvim',
		event = 'VeryLazy',
		opts = {
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
		},
		keys = {
			{ '<c-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
			{
				'<a-/>',
				mode = { 'n', 'x', 'o' },
				function() require('flash').treesitter_search() end,
				desc = 'Treesitter Search'
			},
			-- {
			-- 	'<c-/>w',
			-- 	mode = { 'n', 'x', 'o' },
			-- 	function()
			-- 		require('flash').jump({
			-- 			pattern = vim.fn.expand('<cword>')
			-- 		})
			-- 	end,
			-- 	desc = 'Search for Word'
			-- },
			{
				'<c-/>',
				mode = { 'n', 'x', 'o' },
				function() require('flash').jump() end,
				desc = 'Flash'
			},
		}
	},
}

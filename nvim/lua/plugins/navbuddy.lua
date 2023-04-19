return {
	{
		"SmiteshP/nvim-navic",
		opts = {
			highlight = true
		}
	},
	{
		'SmiteshP/nvim-navbuddy',
		dependencies = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
			{
				'nvim-telescope/telescope.nvim',
				name = 'telescope'
			},
			"numToStr/Comment.nvim",
		},
		opts = function()
			local actions = require('nvim-navbuddy.actions')
			local ivy = require("telescope.themes").get_ivy({})
			return {
				window = {
					border = "rounded",
					size = "75%",
					sections = {
						left = {
							size = "20%"
						},
						mid = {
							size = "30%"
						}
					}
				},
				lsp = {
					auto_attach = true
				},
				icons = {
					Boolean = "󰔡 "
				},
				mappings = {
					["l"] = function(display)
						if display.focus_node.children == nil then
							return
						end

						local child_node
						if display.focus_node.memory then
							child_node = display.focus_node.children[display.focus_node.memory]
						else
							child_node = display.focus_node.children[1]
						end
						display.focus_node = child_node

						display:redraw()
					end,
					["t"] = actions.telescope(ivy)
				},
			}
		end,
		keys = {
			{ '<leader>cm', function() require('nvim-navbuddy').open() end, desc = "Open Navbuddy" }
		}
	}
}

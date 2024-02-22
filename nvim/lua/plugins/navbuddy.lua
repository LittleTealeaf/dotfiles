return {
	{
		'SmiteshP/nvim-navbuddy',
		dependencies = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
			'nvim-telescope/telescope.nvim',
			"numToStr/Comment.nvim",
		},
		opts = function()
			local actions = require('nvim-navbuddy.actions')
			local telescope_layout = require("telescope.themes").get_dropdown({})
			return {
				window = {
					border = Transparent and "rounded" or 'none',
					size = "85%",
					sections = {
						left = {
							size = "17%",
						},
						mid = {
							size = "35%"
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
					["l"] = {
						callback = function(display)
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
						end
					},
					["t"] = actions.telescope(telescope_layout)
				},
			}
		end,
		keys = {
			{ '<leader>cm', function() require('nvim-navbuddy').open() end, desc = "Open Navbuddy" }
		}
	}
}

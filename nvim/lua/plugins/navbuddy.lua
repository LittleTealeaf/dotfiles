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
			"MunifTanjim/nui.nvim"
		},
		opts = {
			window = {
				border = "rounded",
				size = "75%",
				sections = {
					left = {
						size = "25%"
					},
					mid = {
						size = "50%"
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
			},
		},
		keys = {
			{ '<leader>cm', function() require('nvim-navbuddy').open() end, desc = "Open Navbuddy" }
		}
	}
}

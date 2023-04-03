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
		opts = function()
			local actions = require('nvim-navbuddy.actions')
			return {
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
					['<esc>'] = actions.close,
					['q'] = actions.close,
					['j'] = actions.next_sibling,
					['k'] = actions.previous_sibling,
					['h'] = actions.parent,
					['v'] = actions.visual_name,
					['V'] = actions.visual_scope,
					['y'] = actions.yank_name,
					['Y'] = actions.yank_scope,
					['i'] = actions.insert_name,
					['I'] = actions.insert_scope,
					['a'] = actions.append_name,
					['A'] = actions.append_scope,
					['r'] = actions.rename,
					['d'] = actions.delete,
					['f'] = actions.fold_create,
					['F'] = actions.fold_delete,
					['<enter>'] = actions.select,
					['o'] = actions.select,
					['J'] = actions.move_up,
					['K'] = actions.move_down,
				},
			}
		end,
		keys = {
			{ '<leader>cm', function() require('nvim-navbuddy').open() end, desc = "Open Navbuddy" }
		}
	}
}

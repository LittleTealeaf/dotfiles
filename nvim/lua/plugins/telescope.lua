return {
	{
		'nvim-telescope/telescope.nvim',
		event = 'VeryLazy',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build =
				'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
			},
			'folke/noice.nvim',
			'nvim-treesitter/nvim-treesitter',
			'folke/trouble.nvim',
			'ThePrimeagen/harpoon',
			'folke/which-key.nvim',
		},
		config = function()
			local telescope = require('telescope')
			local actions = require('telescope.actions')
			local trouble = require('trouble.sources.telescope')
			local action_state = require('telescope.actions.state')
			local pickers = require('telescope.pickers')
			local harpoon = require('harpoon')
			local flash = require('flash')
			local builtin = require('telescope.builtin')
			local themes = require('telescope.themes')
			local harpoon_list = harpoon:list()
			local wk = require('which-key')

			local function open_with_harpoon(prompt_bufnr)
				local picker = action_state.get_current_picker(prompt_bufnr)
				local multi_selection = picker:get_multi_selection()

				pickers.on_close_prompt(prompt_bufnr)
				if #multi_selection > 0 then
					pcall(vim.api.nvim_win_set_cursor, 0, picker.original_win_id)
					for _, entry in ipairs(multi_selection) do
						if entry.filename then
							harpoon_list:add({ value = entry.filename, context = {} })
						end
					end
				else
					harpoon_list:add({ value = picker:get_selection().filename, context = {} })
				end
			end

			local function flash_action(prompt_bufnr)
				flash.jump({
					pattern = '^',
					label = { after = { 0, 0 } },
					search = {
						mode = 'search',
						exclude = {
							function(win)
								return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= 'TelescopeResults'
							end
						}
					},
					action = function(match)
						local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
						picker:set_selection(match.pos[1] - 1)
					end
				})
			end

			telescope.setup({
				defaults = {
					previewers = {
						cat = {
							cmd = 'bat',
						}
					},
					prompt_prefix = '  ',
					selection_caret = '  ',
					path_display = { 'full' },
					dynamic_preview_title = true,
					results_title = "",
					mappings = {
						i = {
							['<esc>'] = actions.close,
							["<A-q>"] = actions.close,
							["<Tab>"] = actions.move_selection_next,
							["<S-Tab>"] = actions.move_selection_previous,
							['<C-CR>'] = actions.toggle_selection,
							["<C-Down>"] = actions.toggle_selection + actions.move_selection_next,
							["<C-Up>"] = actions.toggle_selection + actions.move_selection_previous,
							["<C-q>"] = actions.smart_send_to_qflist,
							['<C-t>'] = trouble.open,
							['<C-a>'] = actions.toggle_all,
							['<C-h>'] = open_with_harpoon,
							['<C-s>'] = flash_action,
						},
					}
				},
				pickers = {
					find_files = {
						preview = false,
					}
				}
			})

			telescope.load_extension('fzf')
			telescope.load_extension('noice')
			telescope.load_extension('harpoon')

			wk.add({
				{ "<leader>ff", builtin['find_files'], desc = "Find Files with Preview", icon = "" },
				{
					"<leader>fd",
					function()
						builtin['find_files'](themes.get_dropdown({ previewer = false, layout_config = { height = 0.6 } }))
					end,
					desc = "Find Files",
					icon = ""
				},
				{
					"<leader>fg",
					function()
						builtin['live_grep'](themes.get_dropdown({ layout_config = { height = 0.4, width = 0.6 } }))
					end,
					desc = "Live Grep",
					icon = "󰪸"
				},
				{
					"<leader>fl",
					function()
						builtin['current_buffer_fuzzy_find'](themes.get_dropdown({ layout_config = { height = 0.4, width = 0.6 } }))
					end,
					desc = "Search File",
					icon = "󰱽"
				},
				{

					"<leader>fb",
					function()
						builtin['buffers'](themes.get_dropdown({ layout_config = { height = 0.5 } }))
					end,
					desc = "Buffers",
					icon = "󰾵"
				},
				{
					"<leader>fs",
					function()
						builtin['lsp_document_symbols'](themes.get_dropdown({}))
					end,
					desc = "Buffer Symbols",
					icon = "",
				},
				{
					"<leader>fa",
					function()
						builtin['lsp_workspace_symbols'](themes.get_dropdown({}))
					end,
					desc = "Workspace Symbols",
					icon = ""
				},

				{
					"<leader>fo",
					function()
						builtin['oldfiles'](themes.get_dropdown({}))
					end,
					desc = "Old Files",
					icon = ""
				},
				{ "<leader>fc", function() builtin['commands'](themes.get_ivy({})) end, desc = "Commands", icon = "" },
				{
					"<leader>fr",
					function()
						builtin['lsp_references'](themes.get_dropdown({ layout_config = { width = 0.6, height = 0.4 } }))
					end,
					desc = "Lsp References",
					icon = ""
				},
				{ "<leader>fh", builtin['help_tags'], desc = "Help Tags", icon = "󰋖" }
			})
		end
	},
}

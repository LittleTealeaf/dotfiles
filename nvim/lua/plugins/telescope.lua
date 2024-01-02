---@diagnostic disable: unused-function
local function in_dropdown(action)
	return function(args)
		if args == nil then
			args = {}
		end
		action(require('telescope.themes').get_dropdown(args))
	end
end

local function in_ivy(action)
	return function(args)
		if args == nil then
			args = {}
		end
		action(require('telescope.themes').get_ivy(args))
	end
end

local function in_cursor(action)
	return function(args)
		if args == nil then
			args = {}
		end
		action(require('telescope.themes').get_cursor(args))
	end
end

local function use_builtin(name)
	return function(args)
		require('telescope.builtin')[name](args)
	end
end

local function use_extension(extension, action)
	return function(args)
		require('telescope').extensions[extension][action](args)
	end
end

local function with_args(action, override_args)
	return function(args)
		if args == nil then
			args = {}
		end
		for k, v in pairs(override_args) do
			args[k] = v
		end
		action(args)
	end
end


local function load_extension_config(extension)
	return function()
		require('telescope').load_extension(extension)
	end
end

local function open_with_harpoon()
	local action_state = require('telescope.actions.state')
	local mark = require('harpoon.mark')

	return function(prompt_bufnr)
		local picker = action_state.get_current_picker(prompt_bufnr)
		local multi_selection = picker:get_multi_selection()

		require("telescope.pickers").on_close_prompt(prompt_bufnr)
		if #multi_selection > 0 then
			pcall(vim.api.nvim_win_set_cursor, 0, picker.original_win_id)
			for _, entry in ipairs(multi_selection) do
				local filename
				if entry.path or entry.filename then
					filename = entry.path or entry.filename
					mark.add_file(filename)
				end
			end
		else
			for _, entry in pairs(picker._selection_entry) do
				mark.add_file(entry)
			end
		end
	end
end

local function flash(prompt_bufnr)
	require('flash').jump({
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

return {
	{
		'nvim-telescope/telescope.nvim',
		event = 'VeryLazy',
		cond = vim.g.features.telescope,
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
		},
		config = function(_, _)
			local telescope = require('telescope')
			local actions = require('telescope.actions')
			local fb_actions = require 'telescope'.extensions.file_browser.actions
			local trouble = require('trouble.providers.telescope')

			telescope.setup({
				extensions = {
					['ui-select'] = {
						require('telescope.themes').get_dropdown({}),
					},
					file_browser = {
						-- hijack_netrw = true,
						theme = 'ivy',
						mappings = {
							i = {
								['<C-w>'] = false,
								['<C-e>'] = fb_actions.goto_cwd,
								['<C-h>'] = open_with_harpoon(),
								['<C-d>'] = fb_actions.change_cwd
							}
						}
					},
					project = {
						base_dirs = {
							{ '~/dev/', max_depth = 2 }
						},
					}
				},
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
							["<C-Down>"] = actions.toggle_selection + actions.move_selection_worse,
							["<C-Up>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.smart_send_to_qflist,
							['<C-t>'] = trouble.smart_open_with_trouble,
							['<C-a>'] = actions.toggle_all,
							['<C-h>'] = open_with_harpoon(),
							['<C-s>'] = flash,
							['<C-u>'] = false
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
		end,
		keys = {
			{
				'<leader>ff',
				use_builtin("find_files"),
				desc = "Find Files"
			},
			{
				'<leader>fd',
				with_args(use_builtin('find_files'), { previewer = false }),
				desc = "Find Files"
			},
			{
				'<leader>fg',
				in_ivy(use_builtin('live_grep')),
				desc = 'Live grep',
			},
			{
				'<leader>fb',
				in_ivy(use_builtin('buffers')),
				desc = 'List Buffers'
			},
			{
				'<leader>fo',
				in_ivy(use_builtin('oldfiles')),
				desc = 'List Old Files'
			},
			{
				'<leader>fs',
				in_dropdown(use_builtin('lsp_document_symbols')),
				desc = 'List Document Symbols'
			},
			{
				'<leader>fa',
				in_ivy(use_builtin('lsp_workspace_symbols')),
				desc = 'List Workspace Symbols'
			},
			{
				'<leader>fh',
				in_dropdown(use_builtin('help_tags')),
				desc = 'Help Tags',
			},
			{
				'<leader>fl',
				in_dropdown(use_builtin('current_buffer_fuzzy_find')),
				desc = 'Fuzzy Find in Current Buffer'
			},
			{
				'<leader>ft',
				in_dropdown(use_builtin('treesitter')),
				desc = 'List Treesitter Elements'
			},
			{
				'<leader>fc',
				in_ivy(use_builtin('commands')),
				desc = "Fuzzy Search Command"
			},
			{
				'<leader>fu',
				use_builtin('resume'),
				desc = "Resume Last Telescope"
			}
		}
	},
	{
		'nvim-telescope/telescope-file-browser.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim' },
		config = load_extension_config('file_browser'),
		cond = vim.g.features.telescope,
		keys = {
			{
				'<leader>fe',
				function()
					with_args(in_ivy(use_extension('file_browser', 'file_browser')), {
						hidden = true,
						path = vim.fn.expand("%:p:h"),
						previewer = false,
					})()
				end,
				desc = 'File Browser'
			},
			{
				'<leader>fr',
				function()
					with_args(in_ivy(use_extension('file_browser', 'file_browser')), {
						hidden = true
					})()
				end,
				desc = "File Browser from Root"
			}
		}
	},
	{
		'jvgrootveld/telescope-zoxide',
		dependencies = { 'nvim-telescope/telescope.nvim' },
		config = load_extension_config('zoxide'),
		keys = {
			{ '<leader>fz', in_dropdown(use_extension('zoxide', 'list')), desc = "Zoxide" }
		}
	},
	-- {
	-- 	'nvim-telescope/telescope-frecency.nvim',
	-- 	dependencies = { 'nvim-telescope/telescope.nvim' },
	-- 	config = load_extension_config('frecency'),
	-- 	keys = {
	-- 		{
	-- 			'<leader>fx', in_dropdown(use_extension('frecency', 'frecency')), desc = "Frecency"
	-- 		}
	-- 	}
	-- }
}

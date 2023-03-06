return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			"nvim-telescope/telescope-ui-select.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build =
				"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
			},
			'folke/noice.nvim',
		},
		config = function()
			local telescope = require('telescope')
			local setkey = vim.keymap.set
			local actions = require('telescope.builtin')
			local themes = require('telescope.themes')

			telescope.setup({
				extensions = {
							['ui-select'] = {
						require('telescope.themes').get_dropdown()
					},
					file_browser = {
						theme = 'dropdown'
					}
				},
			})

			telescope.load_extension('fzf')
			telescope.load_extension('noice')
			telescope.load_extension('ui-select')


			local use_dropdown = function(action)
				return function(args)
					action(themes.get_dropdown(args))
				end
			end

			setkey('n', '<leader>ff', actions.find_files, {})
			setkey('n', '<leader>fg', actions.live_grep, {})
			setkey('n', '<leader>fw', actions.grep_string, {})
			setkey('n', '<leader>fb', actions.buffers, {})
			setkey('n', '<leader>fo', actions.oldfiles, {})


			-- Symbols
			setkey('n', '<leader>sf', use_dropdown(actions.lsp_document_symbols), {})
			setkey('n', '<leader>sw', use_dropdown(actions.lsp_workspace_symbols), {})

			-- LSP
			setkey('n', '<leader>cdw', use_dropdown(actions.diagnostics))
			setkey('n', '<leader>ca', vim.lsp.buf.code_action, {})

			-- Noice
			setkey('n', '<leader>nn', telescope.extensions.notify.notify, {})
		end,
		-- lazy = true,
		-- keys = {
		-- 	'<leader>ff', '<leader>fg', '<leader>fw', '<leader>fb', '<leader>fo', '<leader>sf', '<leader>sw', '<leader>cd',
		-- 	'<leader>ca', '<leader>nn'
		-- }
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			'nvim-telescope/telescope.nvim'
		},
		config = function()
			local telescope = require('telescope')
			local setkey = vim.keymap.set
			telescope.load_extension('file_browser')
			setkey('n', '<leader>fe', function()
				telescope.extensions.file_browser.file_browser({ hidden = true })
			end, {})
		end,
		lazy = true,
		keys = {
			'<leader>fe'
		}
	},
	{
		"nvim-telescope/telescope-github.nvim",
		dependencies = {
			'nvim-telescope/telescope.nvim',
		},
		config = function()
			local telescope = require('telescope')
			local setkey = vim.keymap.set
			telescope.load_extension('gh')

			setkey('n', '<leader>gi', telescope.extensions.gh.issues, {})
			setkey('n', '<leader>gp', telescope.extensions.gh.pull_request, {})
		end,
		lazy = true,
		keys = {
			'<leader>gi', '<leader>gp'
		}
	},
	{
		'nvim-telescope/telescope-dap.nvim',
		dependencies = {
			'nvim-telescope/telescope.nvim',
		},
		config = function()
			local telescope = require('telescope')
			local setkey = vim.keymap.set
			telescope.load_extension('dap')

			setkey('n', '<leader>dv', telescope.extensions.dap.variables, {})
		end,
		lazy = true,
		keys = {
			'<leader>dv'
		}
	},
	{
		"benfowler/telescope-luasnip.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local telescope = require('telescope')
			local setkey = vim.keymap.set

			telescope.load_extension('luasnip')

			setkey('n', '<leader>cls', telescope.extensions.luasnip.luasnip)
		end,
		lazy = true,
		keys = { '<leader>cls' }
	},
}

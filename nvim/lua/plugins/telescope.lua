return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-github.nvim",
		"nvim-telescope/telescope-dap.nvim",
		'folke/noice.nvim',
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build =
			"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
		}
	},
	config = function()
		local telescope = require('telescope')
		local themes = require('telescope.themes')
		local actions = require('telescope.builtin')
		local setkey = vim.keymap.set

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

		local use_ivy = function(action)
			return function(args)
				action(themes.get_ivy(args))
			end
		end

		local use_dropdown = function(action)
			return function(args)
				action(themes.get_dropdown(args))
			end
		end


		telescope.load_extension('fzf')
		telescope.load_extension('file_browser')
		telescope.load_extension('ui-select')
		telescope.load_extension('dap')
		telescope.load_extension('noice')

		setkey('n', '<leader>fe', function()
			telescope.extensions.file_browser.file_browser({ hidden = true })
		end, {})

		setkey('n', '<leader>ff', actions.find_files, {})
		setkey('n', '<leader>fg', actions.live_grep, {})
		setkey('n', '<leader>fw', actions.grep_string, {})
		setkey('n', '<leader>fb', actions.buffers, {})
		setkey('n', '<leader>fo', actions.oldfiles, {})

		-- Symbols
		setkey('n', '<leader>sf', use_dropdown(actions.lsp_document_symbols), {})
		setkey('n', '<leader>sw', use_dropdown(actions.lsp_workspace_symbols), {})

		-- Coding
		setkey('n', '<leader>ca', vim.lsp.buf.code_action, {})

		-- LSP
		setkey('n', '<leader>cd', use_dropdown(actions.diagnostics))


		-- Dap
		setkey('n', '<leader>dv', telescope.extensions.dap.variables, {})


		-- Noice

		setkey('n', '<leader>nn', telescope.extensions.notify.notify, {})
	end
}

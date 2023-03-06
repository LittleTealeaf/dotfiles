return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-github.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build =
			"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
		}
	},
	config = function()
		local telescope = require('telescope')
		local actions = require('telescope.builtin')
		local setkey = vim.keymap.set

		telescope.setup({
			theme = 'ivy',
			extensions = {
						['ui-select'] = {
					require('telescope.themes').get_dropdown {

					}
				}
			}
		})

		telescope.load_extension('fzf')
		telescope.load_extension('file_browser')
		telescope.load_extension('ui-select')

		setkey('n', '<leader>fe', function()
			telescope.extensions.file_browser.file_browser({ hidden = true })
		end, {})

		setkey('n', '<leader>ff', actions.find_files, {})
		setkey('n', '<leader>fg', actions.live_grep, {})
		setkey('n', '<leader>fw', actions.grep_string, {})
		setkey('n', '<leader>fb', actions.buffers, {})
		setkey('n', '<leader>fo', actions.oldfiles, {})

		-- Symbols
		setkey('n', '<leader>sf', actions.lsp_document_symbols, {})
		setkey('n', '<leader>sw', actions.lsp_workspace_symbols, {})

		-- Coding
		setkey('n', '<leader>ca', vim.lsp.buf.code_action, {})

		-- LSP
	end
}

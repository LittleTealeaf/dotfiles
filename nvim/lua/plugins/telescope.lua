local use_dropdown = function(action)
	return function(args)
		action(require('telescope.themes').get_dropdown(args))
	end
end

local use_ivy = function(action)
	return function(args)
		action(require('telescope.themes').get_ivy(args))
	end
end

local use_action = function(name)
	return function(args)
		require('telescope.builtin')[name](args)
	end
end

local use_extension = function(extension, action)
	return function(args)
		require('telescope').extensions[extension][action](args)
	end
end

local with_args = function(fun, args)
	return function()
		fun(args)
	end
end

local telescope_dependency = {
	'nvim-telescope/telescope.nvim',
	name = 'telescope'
}

local load_extension_config = function(extension)
	return function()
		require('telescope').load_extension(extension)
	end
end


return {
	{
		'nvim-telescope/telescope.nvim',
		name = 'telescope',
		event = 'VeryLazy',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-ui-select.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build =
				'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
			},
			'folke/noice.nvim'
		},
		config = function()
			local telescope = require('telescope')

			telescope.setup({
						['ui-select'] = {
					require('telescope.themes').get_dropdown()
				},
				file_browser = {
					theme = 'dropdown'
				}
			})

			telescope.load_extension('fzf')
			telescope.load_extension('noice')
			telescope.load_extension('ui-select')
		end,
		keys = {
			{ '<leader>ff', use_dropdown(use_action('find_files')),            desc = 'Find files' },
			{ '<leader>fg', use_action('live_grep'),                           desc = 'Live grep' },
			-- { '<leader>fw', use_action('grep_string'), desc = 'Grep String' },
			{ '<leader>fb', use_action('buffers'),                             desc = 'List Buffers' },
			{ '<leader>fo', use_action('oldfiles'),                            desc = 'List Old Files' },
			{ '<leader>sf', use_dropdown(use_action('lsp_document_symbols')),  desc = 'List Document Symbols' },
			{ '<leader>sw', use_dropdown(use_action('lsp_workspace_symbols')), desc = 'List Workspace Symbols' },
			{ '<leader>ca', vim.lsp.buf.code_action,                           desc = 'List Code Actions' },
			{ '<leader>nn', use_dropdown(use_extension('notify', 'notify')),   desc = 'Show Notifications' },
		}
	},
	{
		'nvim-telescope/telescope-file-browser.nvim',
		event = 'VeryLazy',
		dependencies = { telescope_dependency },
		config = load_extension_config('file_browser'),
		keys = {
			{ '<leader>fe', with_args(use_ivy(use_extension('file_browser', 'file_browser')), { hidden = true }),
				desc = 'File Browser' }
		}
	},
	{
		'nvim-telescope/telescope-github.nvim',
		event = 'VeryLazy',
		dependencies = { telescope_dependency },
		config = load_extension_config('gh'),
		keys = {
			{ '<leader>gi', use_extension('gh', 'issues'),        desc = 'GitHub Issues' },
			{ '<leader>gp', use_extension('gh', 'pull_request '), desc = 'GitHub Pull Requests' }
		}
	},
}

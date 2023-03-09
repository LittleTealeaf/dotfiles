return {
	{
		'windwp/nvim-autopairs',
		dependencies = {
			{
				'hrsh7th/nvim-cmp',
				name = 'cmp',
			}
		},
		config = function()
			require('nvim-autopairs').setup()

			require('cmp').event:on(
				'confirm_done',
				require('nvim-autopairs.completion.cmp').on_confirm_done()
			)
		end
	},
	{
		'windwp/nvim-ts-autotag',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		config = true,
	},
	{
		'numToStr/Comment.nvim',
		event = 'VeryLazy',
		opts = {
			mappings = {
				basic = true,
				extra = true
			}
		}
	},
	{
		'pappasam/nvim-repl',
		init = function()
			vim.g.repl_split = 'bottom'
			vim.g.repl_height = 20
			vim.g.repl_filetype_commands = {
				python = 'ipython --no-autoindent'
			}
		end,
		keys = {
			{ '<leader>ro', ':ReplOpen<CR>',    desc = "Open REPL" },
			{ '<leader>rs', ':ReplRunCell<CR>', desc = "REPL Run Cell" },
			{ '<leader>rs', ':ReplSend<CR>',    desc = 'REPL Run Selected', mode = { 'v' } },
			{ '<leader>rh', ':ReplClose<CR>',   desc = 'Close REPL' },
			{ '<leader>rc', ':ReplClear<CR>',   desc = 'Clear REPp' }
		}
	}
}

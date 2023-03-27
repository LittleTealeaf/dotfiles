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
			{ '<leader>ro', '<cmd>ReplOpen<CR>',    desc = "Open REPL" },
			{ '<leader>rs', '<cmd>ReplRunCell<CR>', desc = "REPL Run Cell" },
			{ '<leader>rs', '<cmd>ReplSend<CR>',    desc = 'REPL Run Selected', mode = { 'v' } },
			{ '<leader>rh', '<cmd>ReplClose<CR>',   desc = 'Close REPL' },
			{ '<leader>rc', '<cmd>ReplClear<CR>',   desc = 'Clear REPp' }
		}
	}
}

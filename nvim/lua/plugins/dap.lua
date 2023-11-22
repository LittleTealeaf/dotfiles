-- Notes:
-- lua require('dapui').float_element('watches')

return {
	{
		'mfussenegger/nvim-dap',
		dependencies = { 'williamboman/mason.nvim' },
		cond = vim.g.features.dap,
		config = function()
			local dap = require('dap')

			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointCondition",
				{ text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
			vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "", linehl = "DapStoppedLine" })

			dap.defaults.fallback.exception_breakpoints = { 'raised', 'uncaught', 'rust_panic' }
		end,
		keys = {
			{ '<leader>db', function() require('dap').toggle_breakpoint() end, desc = "Toggle Breakpoint" },
			{ '<leader>dc', function() require('dap').continue() end,          desc = "Dap Continue" },
			{ '<leader>do', function() require('dap').step_out() end,          desc = "Dap Step Out" },
			{ '<leader>dn', function() require('dap').step_over() end,         desc = "Dap Step Over" },
			{ '<leader>di', function() require('dap').step_into() end,         desc = "Dap Step Into", },
			{ '<leader>du', function() require('dap').run_last() end,          desc = "Dap Run Last" },
			{
				'<leader>dl',
				function() require('dap').set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
				desc = "Dap Log Point"
			},
			{ '<leader>dr', function() require('dap').run() end,       desc = "Dap Run" },
			{ '<leader>dt', function() require('dap').terminate() end, desc = "Dap Terminate" },
			{ '<leader>dk', function() require('dapui').eval() end,    desc = "Dap Eval" },
			{ '<leader>dd', function() require('dapui').toggle() end,  desc = "Toggle Dap UI" },
		}
	},
	{
		'rcarriga/nvim-dap-ui',
		cond = vim.g.features.dap,
		dependencies = {
			'mfussenegger/nvim-dap'
		},
		opts = {
			floating = {
				border = 'rounded'
			},
			layouts = {
				{
					elements = {
						{
							id = 'repl',
							size = 0.25
						},
						{
							id = 'stacks',
							size = 0.25
						},
						{
							id = 'scopes',
							size = 0.4
						},
						{
							id = 'breakpoints',
							size = 0.1,
						}
					},
					position = 'right',
					size = 50
				},
				{
					elements = {
						{
							id = 'console',
							size = 0.4
						},
						{
							id = 'watches',
							size = 0.6,
						},
					},
					position = 'bottom',
					size = 10
				}
			}
		},
		config = function(_, opts)
			local dap, dapui = require('dap'), require('dapui')
			dapui.setup(opts)
			dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
			dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
			dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end
		end,
	},
	{
		'theHamsta/nvim-dap-virtual-text',
		cond = vim.g.features.dap,
		dependencies = {
			'mfussenegger/nvim-dap',
			'nvim-treesitter/nvim-treesitter',
		},
		config = true,
	}
}

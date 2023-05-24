return {
	{
		'mfussenegger/nvim-dap',
		dependencies = { 'williamboman/mason.nvim' },
		config = function()
			local dap = require('dap')
			local mason_registry = require('mason-registry')
			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointCondition",
				{ text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
			vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })

			dap.defaults.fallback.exception_breakpoints = { 'raised', 'uncaught', 'panic' }

			dap.adapters['pwa-node'] = {
				type = 'server',
				host = 'localhost',
				port = '${port}',
				executable = {
					command = 'node',
					args = {
						mason_registry.get_package('js-debug-adapter'):get_install_path() .. "/js-debug/src/dapDebugServer.js",
						"${port}"
					}
				}
			}
			dap.configurations.javascript = {
				{
					type = 'pwa-node',
					request = 'launch',
					name = 'Launch file',
					program = '${file}',
					cwd = "${workspaceFolder}"
				}
			}
		end,
		keys = {
			{ '<leader>db', function() require('dap').toggle_breakpoint() end, "Toggle Breakpoint" },
			{ '<leader>dc', function() require('dap').continue() end,          "Dap Continue" },
			{ '<leader>do', function() require('dap').step_out() end,          "Dap Step Out" },
			{ '<leader>dn', function() require('dap').step_over() end,         "Dap Step Over" },
			{ '<leader>di', function() require('dap').step_into() end,         "Dap Step Into", },
			{ '<leader>dl', function() require('dap').run_last() end,          "Dap Run Last" },
			{ '<leader>dr', function() require('dap').run() end,               "Dap Run" },
			{ '<leader>dk', function() require('dapui').eval() end,            "Dap Eval" },
			{ '<leader>dd', function() require('dapui').toggle() end,          "Toggle Dap UI" },
		}
	},
	{
		'rcarriga/nvim-dap-ui',
		dependencies = {
			'mfussenegger/nvim-dap'
		},
		config = function()
			local dap, dapui = require('dap'), require('dapui')

			require('dapui').setup({
				floating = {
					border = 'rounded'
				},
				layouts = {
					{
						elements = {
							{
								id = 'scopes',
								size = 0.25
							},
							{
								id = 'breakpoints',
								size = 0.25,
							},
							{
								id = 'stacks',
								size = 0.25
							},
							{
								id = 'watches',
								size = 0.25,
							}
						},
						position = 'right',
						size = 50
					},
					{
						elements = {
							{
								id = 'repl',
								size = 0.5
							},
							{
								id = 'console',
								size = 0.5
							},
						},
						position = 'bottom',
						size = 10
					}
				}
			})

			dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
			dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
			dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end
		end,
	}
}

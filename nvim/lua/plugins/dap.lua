return {
	{
		'mfussenegger/nvim-dap',
		config = function()
			require('dap')
			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointCondition",
				{ text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
			vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })
		end,
		keys = {
			{ '<leader>db', function() require('dap').toggle_breakpoint() end, "Toggle Breakpoint" },
			{ '<leader>dc', function() require('dap').continue() end,          "Dap Continue" },
			{ '<leader>do', function() require('dap').step_out() end,          "Dap Step Out" },
			{ '<leader>dn', function() require('dap').step_over() end,         "Dap Step Over" },
			{ '<leader>di', function() require('dap').step_into() end,         "Dap Step Into", },
			{ '<leader>dr', function() require('dap').repl.open() end,         "Dap Repl" },
			{ '<leader>dk', function() require('dapui').eval() end,            "Dap Eval" },
			{ '<leader>dx', function() require('dapui').toggle() end,          "Toggle Dap UI" },
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
				}
			})

			dap.listeners.after.event_initialized['dapui_config'] = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated['dapui_config'] = function()
				dapui.close()
			end

			dap.listeners.before.event_exited['dapui_config'] = function()
				dapui.close()
			end
		end,
	}
}

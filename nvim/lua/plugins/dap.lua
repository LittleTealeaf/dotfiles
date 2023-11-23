-- Notes:
-- lua require('dapui').float_element('watches')


local function eval_input()
	local input = vim.fn.input("Evaluate: ")
	if input ~= nil then
		require('dapui').eval(input, { enter = true })
	end
end

local function create_log_point()
	local input = vim.fn.input("Log Point: ")
	if input ~= nil then
		require('dap').set_breakpoint(nil, nil, input)
	end
end

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
			{ '<leader>dl', create_log_point,                                  desc = "Dap Log Point" },
			{ '<leader>dt', function() require('dap').terminate() end,         desc = "Dap Terminate" },
			{ '<leader>dF', function() require('dap').focus_frame() end,       desc = "Focus Frame" },
		}
	},
	{
		'rcarriga/nvim-dap-ui',
		cond = vim.g.features.dap,
		dependencies = {
			'mfussenegger/nvim-dap'
		},
		lazy = false,
		opts = {
			controls = {
				enabled = true,
				element = 'console'
			},
			floating = {
				border = 'rounded'
			},
			layouts = {
				{
					position = "bottom",
					size = 10,
					elements = {
						"console",
					}
				},
			}
		},
		config = function(_, opts)
			local dap, dapui = require('dap'), require('dapui')
			dapui.setup(opts)
			-- dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
			dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
			dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end
		end,
		keys = {
			{ '<leader>dk', function() require('dapui').eval(nil, { enter = true }) end,                desc = "Evaluate Selected" },
			{ '<leader>de', eval_input,                                                                 desc = "Evaluate Expression" },
			{ '<leader>dd', function() require('dapui').toggle() end,                                   desc = "Toggle Dap UI" },
			{ '<leader>dw', function() require('dapui').float_element('watches', { enter = true }) end, desc = "Watches" },
			{ '<leader>dv', function() require('dapui').float_element('scopes', { enter = true }) end,  desc = "Scopes" },
			{ '<leader>df', function() require('dapui').float_element('stacks', { enter = true }) end,  desc = "Stacks" },
			{ '<leader>dC', function() require('dapui').float_element('console', { enter = true }) end, desc = "Console" },
			{ '<leader>dr', function() require('dapui').float_element('repl', { enter = true }) end,    desc = "REPL" },
			{ '<leader>dB', function() require('dapui').float_element('breakpoints', { enter = true }) end,    desc = "Breakpoints" },
		}
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

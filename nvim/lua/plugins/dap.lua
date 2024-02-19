-- TODO: Set this up to not load unless needed, and then once it does it sets up the keybinds?

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

local DAP_KEYBINDS = {
	{ '<leader>db', function() require('dap').toggle_breakpoint() end,                            desc = "Toggle Breakpoint" },
	{ '<leader>dm', function() require('dap').toggle_breakpoint(vim.fn.input("Condition: ")) end, desc = "Conditional Breakpoint" },
	{ '<leader>da', function() require('dap').continue() end,                                     desc = "Continue" },
	{ '<leader>do', function() require('dap').step_out() end,                                     desc = "Dap Step Out" },
	{ '<leader>ds', function() require('dap').step_over() end,                                    desc = "Dap Step Over" },
	{ '<leader>di', function() require('dap').step_into() end,                                    desc = "Dap Step Into", },
	{ '<leader>du', function() require('dap').run_last() end,                                     desc = "Dap Run Last" },
	{ '<leader>dl', create_log_point,                                                             desc = "Dap Log Point" },
	{ '<leader>dt', function() require('dap').terminate() end,                                    desc = "Dap Terminate" },
	{ '<leader>dx', function() require('dap').focus_frame() end,                                  desc = "Focus Frame" },
}

local DAPUI_KEYBINDS = {
	{ '<leader>dk', function() require('dapui').eval(nil, { enter = true }) end,                    desc = "Evaluate Selected" },
	{ '<leader>dv', function() require('dapui').float_element('scopes', { enter = true }) end,      desc = "Scopes" },
	{ '<leader>dw', function() require('dapui').float_element('watches', { enter = true }) end,     desc = "Watches" },
	{ '<leader>de', eval_input,                                                                     desc = "Evaluate Expression" },
	{ '<leader>dr', function() require('dapui').float_element('repl', { enter = true }) end,        desc = "REPL" },
	{ '<leader>dd', function() require('dapui').toggle() end,                                       desc = "Toggle Dap UI" },
	{ '<leader>df', function() require('dapui').float_element('stacks', { enter = true }) end,      desc = "Stacks" },
	{ '<leader>dj', function() require('dapui').float_element('breakpoints', { enter = true }) end, desc = "Breakpoints" },
}

return {
	{
		'mfussenegger/nvim-dap',
		dependencies = { 'williamboman/mason.nvim' },
		cond = vim.g.features.dap,
		init = function()
			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointCondition",
				{ text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
			vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "", linehl = "DapStoppedLine" })
		end,
		config = function()
			local dap = require('dap')
			dap.defaults.fallback.exception_breakpoints = { 'raised', 'uncaught', 'rust_panic' }
		end,
		keys = DAP_KEYBINDS
	},
	{
		'rcarriga/nvim-dap-ui',
		dependencies = {
			'mfussenegger/nvim-dap'
		},
		cond = vim.g.features.dap,
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
						{
							id = 'watches',
							size = 0.4
						},
						{
							id = "console",
							size = 0.6
						},
					}
				},
			}
		},
		config = function(_, opts)
			local dap, dapui = require('dap'), require('dapui')
			dapui.setup(opts)
			dap.listeners.after.event_initialized['dapui_config'] = dapui.open
			dap.listeners.before.event_terminated['dapui_config'] = dapui.close
			dap.listeners.before.event_exited['dapui_config'] = dapui.close
		end,
		keys = DAPUI_KEYBINDS
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

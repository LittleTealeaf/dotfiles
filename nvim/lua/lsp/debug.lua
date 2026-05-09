---@diagnostic disable: missing-fields
vim.pack.add({
	Github('mfussenegger/nvim-dap'),
	Github('rcarriga/nvim-dap-ui'),
	Github('theHamsta/nvim-dap-virtual-text'),
	Github('nvim-neotest/nvim-nio'),
})


local dap = require('dap')
local dapui = require('dapui')
local virtual_text = require('nvim-dap-virtual-text')


virtual_text.setup({})
dapui.setup({
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
})


require('lsp.debug-adapters')


dap.defaults.fallback.exception_breakpoints = { 'raised', 'uncaught', 'rust_panic' }

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close


vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition",
	{ text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", linehl = "DapStoppedLine" })


vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = "Breakpoint" })
vim.keymap.set('n', '<leader>dm', function() dap.toggle_breakpoint(vim.fn.input("Condition: ")) end,
	{ desc = "Conditional Breakpoint" })

vim.keymap.set('n', '<leader>da', dap.continue, { desc = "Continue" })
vim.keymap.set('n', '<leader>do', dap.step_out, { desc = "Step Out" })
vim.keymap.set('n', '<leader>ds', dap.step_over, { desc = "Step Over" })
vim.keymap.set('n', '<leader>di', dap.step_into, { desc = "Step Into" })
vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = "Terminate" })

vim.keymap.set('n', '<leader>du', dap.run_last, { desc = "Run Last" })



vim.keymap.set('n', '<leader>dk', function() dapui.eval(nil, { enter = true }) end, { desc = "Evaluate Selected" })
vim.keymap.set('n', '<leader>dv', function() dapui.float_element('scopes', { enter = true }) end, { desc = "Scopes" })
vim.keymap.set('n', '<leader>dw', function() dapui.float_element('watches', { enter = true }) end, { desc = "Watches" })
vim.keymap.set('n', '<leader>de', function()
	local input = vim.fn.input("Evaluate: ")
	if input ~= nil then
		dapui.eval(input, { enter = true })
	end
end, { desc = "Evaluate" }
)
vim.keymap.set('n', '<leader>dr', function() dapui.float_element('repl', { enter = true }) end, { desc = "repl" })
vim.keymap.set('n', '<leader>dd', dapui.toggle, { desc = "Toggle UI" })
vim.keymap.set('n', '<leader>df', function() dapui.float_element('stacks', { enter = true }) end, { desc = "Stacks" })
vim.keymap.set('n', '<leader>dj', function() dapui.float_element('brgeakpoints', { enter = true }) end,
	{ desc = "Breakpoints" })

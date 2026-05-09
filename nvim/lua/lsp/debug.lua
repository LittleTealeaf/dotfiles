---@diagnostic disable: missing-fields
vim.pack.add({
	Github('mfussenegger/nvim-dap'),
	Github('rcarriga/nvim-dap-ui'),
	Github('igorlfs/nvim-dap-view'),
})

local dap = require('dap')


dap.defaults.fallback.exception_breakpoints = { 'raised', 'uncaught', 'rust_panic' }

-- dap.listeners.after.event_initialized['dap_view_config'] = dap_view.open
-- dap.listeners.before.event_terminated['dap_view_config'] = dap_view.close
-- dap.listeners.before.event_exited['dap_view_config'] = dap_view.close


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


---- DAP VIEW

local dap_view = require('dap-view')

dap_view.setup({
	auto_toggle = true,
	windows = {
		terminal = {
			position = "right"
		}
	},
	virtual_text = {
		enabled = true,
	}
})



vim.keymap.set('n', '<leader>dd', function() dap_view.toggle(true) end, { desc = "Toggle Dap View" })
vim.keymap.set('n', '<leader>dk', dap_view.hover, { desc = "Dap View Hover" })
vim.keymap.set('n', '<leader>dw', dap_view.add_expr, { desc = "Show Watches" })

return {
	'mfussenegger/nvim-dap',
	dependencies = {
		'mfussenegger/nvim-dap-python',
		'rcarriga/nvim-dap-ui',
	},
	config = function()
		local dapui = require('dapui')
		dapui.setup()

		require('dap-python').setup('~/anaconda3/bin/python')

		local setkey = vim.keymap.set


		setkey('n', '<leader>dt', dapui.toggle)
		setkey('n', '<leader>db', ':DapToggleBreakpoint<CR>', { silent = true })
		setkey('n', '<leader>dc', ':DapContinue<CR>', { silent = true })
		setkey('n', '<leader>dsi', ':DapStepInto<CR>', { silent = true })
		setkey('n', '<leader>dso', ':DapStepOut<CR>', { silent = true })
		setkey('n', '<leader>dsa', ':DapStepOver<CR>', { silent = true })
		setkey('n', '<leader>dr', ':DapRestartFrame<CR>', { silent = true })
	end,
	lazy = true,
	keys = {
		'<leader>dt'
	}
}

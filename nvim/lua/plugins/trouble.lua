local function quickfix_to_trouble(data)
	vim.cmd('close')
	vim.cmd('Trouble quickfix')
end

local function trouble_navigate(direction)
	return function()
		require('trouble')[direction]({ skip_groups = true, jump = true })
	end
end

return {
	'folke/trouble.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	opts = {
		auto_open = false,
		height = 15,
		action_keys = {
			jump = { '<cr>' },
		},
		use_diagnostic_signs = true,
	},
	config = function(_, opts)
		require('trouble').setup(opts)
	end,
	init = function()
		vim.api.nvim_create_autocmd('FileType', {
			pattern = 'qf',
			callback = function() vim.schedule(quickfix_to_trouble) end
		})
	end,
	event = {
		'BufEnter *qf*'
	},
	keys = {
		{ '<leader>te', '<cmd>Trouble workspace_diagnostics<cr>', desc = "Open Trouble Diagnostics" },
		{ '<leader>tr', '<cmd>Trouble lsp_references<cr>',        desc = "Open Trouble Lsp References" },
		{ '<leader>td', '<cmd>Trouble lsp_definitions<cr>',       desc = "Open Trouble Lsp Definitions" },
		{ '<leader>ti', '<cmd>Trouble lsp_implementations<cr>',   desc = "Open Trouble Lsp Implementations" },
		{ '<leader>ty', '<cmd>Trouble lsp_type_definitions<cr>',  desc = "Open Trouble Lsp Type Definitions" },
		{ '<leader>tq', '<cmd>Trouble quickfix<cr>',              desc = "Open Quickfix in Trouble" },
		{ '<leader>tf', '<cmd>Trouble telescope<cr>',             desc = "Open Trouble Telescope" },
		{ '<leader>tt', '<cmd>Trouble<cr>',                       desc = "Toggle Trouble" },
		{ '<leader>th', '<cmd>TroubleClose<cr>',                  desc = "Close Trouble Window" },
		{ '<leader>tj', trouble_navigate('next'),                 desc = "Next Trouble Item" },
		{ '<leader>tk', trouble_navigate('previous'),             desc = "Previous Trouble Item" },
		{ '<leader>tn', trouble_navigate('first'),                desc = 'First Trouble Item' },
		{ '<leader>tm', trouble_navigate('last'),                 desc = 'Last Trouble Item' },
	}
}

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
	config = function()
		require('trouble').setup(
			{
				auto_open = false,
				height = 15,
				action_keys = {
					-- jump_close = { '<cr>' },
					jump = { '<cr>' },
					-- jump = nil,
				},
				use_diagnostic_signs = true,
			}
		)

		vim.api.nvim_create_autocmd('FileType', {
			pattern = 'qf',
			callback = function() vim.schedule(quickfix_to_trouble) end
		})
	end,
	keys = {
		{ '<leader>te', '<cmd>Trouble workspace_diagnostics<cr>', desc = "Open Trouble Diagnostics" },
		{ '<leader>tr', '<cmd>Trouble lsp_references<cr>',        desc = "Open Trouble Lsp References" },
		{ '<leader>td', '<cmd>Trouble lsp_definitions<cr>',       desc = "Open Trouble Lsp Definitions" },
		{ '<leader>ti', '<cmd>Trouble lsp_implementations<cr>',   desc = "Open Trouble Lsp Implementations" },
		{ '<leader>ty', '<cmd>Trouble lsp_type_definitions<cr>',  desc = "Open Trouble Lsp Type Definitions" },
		{ '<leader>tq', '<cmd>Trouble quickfix<cr>',              desc = "Open Quickfix in Trouble" },
		{ '<leader>tf', '<cmd>Trouble telescope<cr>',             desc = "Open Trouble Telescope" },
		{ '<leader>tt', '<cmd>Trouble<cr>',                       desc = "Toggle Trouble" },
		{ '<leader>tn', '<cmd>TroubleClose<cr>',                  desc = "Close Trouble Window" },
		{ '<leader>tj', trouble_navigate('next'),                 desc = "Next Trouble Item" },
		{ '<leader>tk', trouble_navigate('previous'),             desc = "Previous Trouble Item" },
		{ '<leader>th', trouble_navigate('first'),                desc = 'First Trouble Item' },
		{ '<leader>tl', trouble_navigate('last'),                 desc = 'Last Trouble Item' },
	}
}

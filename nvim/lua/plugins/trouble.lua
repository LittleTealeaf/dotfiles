local function quickfix_to_trouble(_)
	vim.cmd('close')
	vim.cmd('Trouble quickfix')
end

local function action_navigate(direction)
	return function()
		require('trouble')[direction]({ skip_groups = true, jump = true })
	end
end

local function action_open(mode)
	return function()
		require('trouble').open(mode)
	end
end

local function action_toggle(mode)
	return function()
		require('trouble').toggle(mode)
	end
end

local function action_close()
	return function()
		require('trouble').close()
	end
end;

return {
	'folke/trouble.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	opts = {
		auto_open = false,
		-- group = false,
		height = 15,
		action_keys = {
			jump = { '<cr>' },
		},
		use_diagnostic_signs = true,
		win_config = {
			border = "none"
		},
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
		{ '<leader>te', action_open('workspace_diagnostics'), desc = "Open Trouble Diagnostics" },
		{ '<leader>tr', action_open('lsp_references'),        desc = "Open Trouble Lsp References" },
		{ '<leader>td', action_open('lsp_definitions'),       desc = "Open Trouble Lsp Definitions" },
		{ '<leader>ti', action_open('lsp_implementations'),   desc = "Open Trouble Lsp Implementations" },
		{ '<leader>ty', action_open('lsp_type_definitions'),  desc = "Open Trouble Lsp Type Definitions" },
		{ '<leader>tq', action_open('quickfix'),              desc = "Open Quickfix in Trouble" },
		{ '<leader>tf', action_open('telescope'),             desc = "Open Trouble Telescope" },
		{ '<leader>tt', action_toggle(),                      desc = "Toggle Trouble" },
		{ '<leader>th', action_close(),                       desc = "Close Trouble Window" },
		{ '<leader>tj', action_navigate('next'),              desc = "Next Trouble Item" },
		{ '<leader>tk', action_navigate('previous'),          desc = "Previous Trouble Item" },
		{ '<leader>tn', action_navigate('first'),             desc = 'First Trouble Item' },
		{ '<leader>tm', action_navigate('last'),              desc = 'Last Trouble Item' },
	}
}

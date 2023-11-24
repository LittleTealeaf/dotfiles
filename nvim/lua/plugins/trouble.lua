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

local function action_close()
	return function()
		require('trouble').close()
	end
end


local function toggle_trouble()
	if vim.bo.filetype == 'Trouble' then
		require('trouble').toggle()
	else
		for _, winid in ipairs(vim.api.nvim_list_wins()) do
			local bufnr = vim.api.nvim_win_get_buf(winid)
			local filetype, _ = vim.filetype.match({ buf = bufnr })
			if filetype == 'Trouble' then
				vim.api.nvim_set_current_win(winid)
				return
			end
		end
		require('trouble').open()
	end
end

return {
	'folke/trouble.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	opts = {
		auto_open = false,
		-- group = false,
		height = 15,
		padding = false,
		action_keys = {
			jump = { '<cr>' },
			jump_close = { '<S-cr>' },
			open_tab = {}
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
		{ '<leader>te', action_open('workspace_diagnostics'), desc = "Trouble Workspace Diagnostics" },
		{ '<leader>tr', action_open('lsp_references'),        desc = "Trouble LSP References" },
		{ '<leader>td', action_open('lsp_definitions'),       desc = "Trouble LSP Definitions" },
		{ '<leader>ti', action_open('lsp_implementations'),   desc = "Trouble LSP Impelmentations" },
		{ '<leader>ty', action_open('lsp_type_definitions'),  desc = "Trouble LSP Type Definitions" },
		{ '<leader>tq', action_open('quickfix'),              desc = "Trouble Quickfix" },
		{ '<leader>tf', action_open('telescope'),             desc = "Trouble Telescope" },
		{ '<leader>tl', action_open('loclist'),               desc = "Trouble Loclist" },
		{ '<leader>tt', toggle_trouble,                       desc = "Toggle Trouble" },
		{ '<leader>th', action_close(),                       desc = "Close Trouble Window" },
		{ '<leader>tj', action_navigate('next'),              desc = "Next Trouble Item" },
		{ '<leader>tk', action_navigate('previous'),          desc = "Previous Trouble Item" },
		{ '<leader>tn', action_navigate('first'),             desc = 'First Trouble Item' },
		{ '<leader>tm', action_navigate('last'),              desc = 'Last Trouble Item' },
	}
}

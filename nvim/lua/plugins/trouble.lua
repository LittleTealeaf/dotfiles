-- TODO: Apply vim.fn treatment and load all the time

local function quickfix_to_trouble(_)
	vim.cmd('close')
	vim.cmd('Trouble quickfix')
end



local function toggle_trouble()
	if vim.bo.filetype == 'Trouble' then
		require('trouble').toggle()
	else
		for _, winid in ipairs(vim.api.nvim_list_wins()) do
			local bufnr = vim.api.nvim_win_get_buf(winid)
			local name = vim.api.nvim_buf_get_name(bufnr)

			if name == vim.fn.getcwd() .. "/Trouble" then
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
	config = function()
		local trouble = require('trouble')


		trouble.setup({
			auto_open = false,
			height = 15,
			padding = false,
			action_keys = {
				jump = { '<cr>' },
				jump_close = { '<S-cr>' },
				open_tab = {}
			},
			use_diagnostic_signs = true,
			win_config = {
				border = Transparent and nil or "none"
			},
		})


		vim.keymap.set('n', '<leader>te', function() trouble.open('workspace_diagnostics') end,
			{ desc = "Workspace Diagnostics" })
		vim.keymap.set('n', '<leader>tr', function() trouble.open('lsp_references') end, { desc = "LSP References" })
		vim.keymap.set('n', '<leader>td', function() trouble.open('lsp_definitions') end, { desc = "LSP Definitions" })
		vim.keymap.set('n', '<leader>ti', function() trouble.open('lsp_implementations') end,
			{ desc = "LSP Implementations" })
		vim.keymap.set('n', '<leader>ty', function() trouble.open('lsp_type_definitions') end,
			{ desc = "LSP Type Definition" })
		vim.keymap.set('n', '<leader>tq', function() trouble.open('quickfix') end, { desc = "Quickfix" })
		vim.keymap.set('n', '<leader>tf', function() trouble.open('telescope') end, { desc = "Telescope" })
		vim.keymap.set('n', '<leader>tl', function() trouble.open('loclist') end, { desc = "Loclist" })
		vim.keymap.set('n', '<leader>tt', toggle_trouble, { desc = "Toggle Trouble" })
		vim.keymap.set('n', '<leader>th', function() trouble.close() end, { desc = "Close" })

		vim.keymap.set('n', '<leader>tj', function() trouble['next']({ skip_groups = true, jump = true }) end,
			{ desc = "Next" })
		vim.keymap.set('n', '<leader>tk', function() trouble['prev']({ skip_groups = true, jump = true }) end,
			{ desc = "Prev" })
		vim.keymap.set('n', '<leader>tn', function() trouble['first']({ skip_groups = true, jump = true }) end,
			{ desc = "First" })
		vim.keymap.set('n', '<leader>tm', function() trouble['last']({ skip_groups = true, jump = true }) end,
			{ desc = "Last" })
	end,
	init = function()
		vim.api.nvim_create_autocmd('FileType', {
			pattern = 'qf',
			callback = function() vim.schedule(quickfix_to_trouble) end
		})
	end,
}

return {
	'stevearc/oil.nvim',
	dependencies = { 'nvimtree/nvim-web-devicons' },
	opts = {
		keymaps = {
			['<C-v>'] = 'actions.select_vsplit',
			['<C-x>'] = 'actions.select_split',
			['<M-q>'] = 'actions.close',
			['<C-t>'] = false,
			['<C-y>'] = 'actions.copy_entry_path',
			['<C-r>'] = function()
				local Path = require('plenary.path')
				local oil = require('oil')
				local file = oil.get_cursor_entry().name
				local dir = oil.get_current_dir()
				local path = Path:new(dir .. file)
				vim.ui.input(
					{
						prompt = "New File Name",
						default = path:absolute(),
						completion = 'file'
					},
					function(input)
						if input ~= nil and input ~= "" then
							path:rename { new_name = Path:new(input).filename }
							require('oil.actions').refresh.callback()
						end
					end)
			end
		}
	},
	lazy = false,
	config = true,
	keys = {
		{ '<leader>ef', function() require('oil').open() end,       desc = "Open Oil" },
		{ '<leader>eg', function() require('oil').open_float() end, desc = "Open Oil Float" },
	}
}

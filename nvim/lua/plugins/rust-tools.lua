local function execute_from_toggleterm(command, args, cwd)
	local Terminal = require('toggleterm.terminal').Terminal
	local utils = require('rust-tools.utils.utils')

	Terminal:new({
		cmd = utils.make_command_from_args(command, args),
		dir = cwd,
		close_on_exit = false,
		auto_scroll = true,
		on_open = function(t)
			vim.api.nvim_buf_set_keymap(t.bufnr, 'n','q','<cmd>close<CR>', {noremap = true, silent = true})
		end
	}):toggle()
end


return {
	{
		'simrat39/rust-tools.nvim',
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'akinsho/toggleterm.nvim',
		},
		ft = 'rust',
		config = function()
			local mason_registry = require('mason-registry')
			local codelldb = mason_registry.get_package('codelldb')
			local extension_path = codelldb:get_install_path() .. "/extension/"
			local this_os = vim.loop.os_uname().sysname;
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb"

			if this_os:find "Windows" then
				codelldb_path = extension_path .. "adapter\\codelldb.exe"
				liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
			else
				liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
			end

			require('rust-tools').setup({
				dap = {
					adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
				},
				server = {
					on_attach = function(_, bufnr)
						local rt = require('rust-tools')
						vim.keymap.set('n', '<leader>crr', rt.hover_actions.hover_actions, { buffer = bufnr })
						vim.keymap.set('n', '<leader>cra', rt.code_action_group.code_action_group, { buffer = bufnr })
						vim.keymap.set('n', '<leader>cre', rt.runnables.runnables)
						vim.keymap.set('n', '<leader>crd', require('rust-tools.debuggables').debuggables)
					end,
				},
				tools = {
					executor = { execute_command = execute_from_toggleterm },
					hover_actions = {
						auto_focus = true,
					}
				}
			})
		end
	}
}
-- TODO: Go through package list manually and instead create a script to check / use the system installed version
return {
	{
		'jay-babu/mason-nvim-dap.nvim',
		event = 'VeryLazy',
		dependencies = { 'williamboman/mason.nvim', 'mfussenegger/nvim-dap' },
		cond = vim.g.features.dap,
		config = function()
			require('mason-nvim-dap').setup({
				ensure_installed = { 'debugpy', 'java-debug-adapter', 'js-debug-adapter', 'delve' },
				handlers = {},
			})
			local dap = require('dap')

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "127.0.0.1",
				port = 8123,
				executable = {
					command = "js-debug-adapter"
				}
			}

			for _, language in ipairs { "javascript", "typescript" } do
				dap.configurations[language] = {
					{
						type = 'pwa-node',
						request = 'launch',
						name = 'Launch file',
						program = '${file}',
						cwd = "${workspaceFolder}",
						runtimeExecutable = "node"
					}
				}
			end
		end
	}
}

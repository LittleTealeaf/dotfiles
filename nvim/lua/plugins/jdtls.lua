return {
	'mfussenegger/nvim-jdtls',
	dependencies = {'mfussenegger/nvim-dap','williamboman/mason.nvim'},
	config = function()

		local mason_registry = require('mason-registry')
		local java_debug = mason_registry.get_package('java-debug-adapter')
		local path = java_debug:get_install_path()
		local java_debug_path = path..'/extension/server/com.microsoft.java.debug.plugin-*.jar'

		if vim.loop.os_uname().sysname:find "Windows" then
			print('AAHHH WINDOWS 1243')
		end

		vim.api.nvim_create_autocmd('filetype', {
			pattern = 'java',
			callback = function()
				local config = {
					cmd = { '/usr/bin/jdtls' },
					root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw' }, { upwrad = true })[1]),
					handlers = {
						['language/status'] = function() end,
						['$/progress'] = function() end
					},
					['init_options'] = {
						bundles = {
							vim.fn.glob(java_debug_path)
						}
					}
				}
				require('jdtls').start_or_attach(config)
			end
		})
	end,
	ft = "java"
}

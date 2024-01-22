local function get_java_debug_path()
	local mason_registry = require('mason-registry')
	local java_debug = mason_registry.get_package('java-debug-adapter')
	local path = java_debug:get_install_path()
	return vim.fn.glob(path .. '/extension/server/com.microsoft.java.debug.plugin-*.jar')
end

local function get_java_test_paths()
	local mason_registry = require('mason-registry')
	local java_test = mason_registry.get_package('java-test')
	local path = java_test:get_install_path()
	return vim.split(vim.fn.glob(path .. '/extension/server/*.jar'), "\n")
end

return {
	'mfussenegger/nvim-jdtls',
	dependencies = { 'mfussenegger/nvim-dap', 'williamboman/mason.nvim' },
	config = function()
		if vim.loop.os_uname().sysname:find "Windows" then
			print('ITS WINDOWS! RUN!')
			return
		end

		local java_debug_path = get_java_debug_path()
		local java_test_paths = get_java_test_paths()

		local bundles = vim.list_extend({ java_debug_path }, java_test_paths)


		vim.api.nvim_create_autocmd('filetype', {
			pattern = 'java',
			callback = function(buffer)
				local config = {
					cmd = { '/usr/bin/jdtls' },
					root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', 'gradlew', 'build.gradle' },
						{ upwrad = true })[1]),
					handlers = {
						['language/status'] = function() end,
						['$/progress'] = function() end
					},
					['init_options'] = {
						bundles = bundles
					},
					on_attach = function(client, bufnr)
						require('jdtls').setup_dap({ hotcodereplace = "auto" })
						require('jdtls.dap').setup_dap_main_class_configs()
						require('jdtls.setup').add_commands()
					end
				}
				require('jdtls').start_or_attach(config)
			end
		})
	end,
	ft = "java"
}

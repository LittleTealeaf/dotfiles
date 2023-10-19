return {
	'mfussenegger/nvim-jdtls',
	config = function()
		vim.api.nvim_create_autocmd('filetype', {
			pattern = 'java',
			callback = function()
				local config = {
					cmd = { '/usr/bin/jdtls' },
					root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw' }, { upwrad = true })[1]),
					handlers = {
						['language/status'] = function() end,
						['$/progress'] = function() end
					}
				}
				require('jdtls').start_or_attach(config)
			end
		})
	end,
	ft = "java"
}

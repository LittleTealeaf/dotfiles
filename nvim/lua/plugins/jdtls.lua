return {
	'mfussenegger/nvim-jdtls',
	config = function()
		local config = {
			cmd = { '/usr/bin/jdtls' },
			root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upwrad = true })[1]),
			handlers = {
				['langauge/status'] = function(_, result)
				end,
				['$/progress'] = function(_, result, ctx)
				end
			}
		}

		require('jdtls').start_or_attach(config)
	end,
	ft = 'java'
}

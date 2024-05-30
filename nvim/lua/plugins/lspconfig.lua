local LSP_CONFIG = require('lsp_config')

local function on_lsp_attach(client, _)
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true)
		end
end

local function check_system(system)
	if system['bin'] ~= nil then
		local file = io.open('/usr/bin/' .. system['bin'], 'r')
		if file then
			file:close()
			return '/usr/bin/' .. system['bin']
		else
			return nil
		end
	end
	return nil
end

return {
	'williamboman/mason-lspconfig.nvim',
	dependencies = {
		{ 'hrsh7th/cmp-nvim-lsp', },
		{ 'williamboman/mason.nvim', },
		{ 'neovim/nvim-lspconfig', },
	},
	cond = vim.g.features.lsp,
	config = function()
		local lspconfig = require('lspconfig')
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		require('mason-lspconfig').setup_handlers({
			function(server_name)
				local lsp_config = LSP_CONFIG[server_name]
				local settings = nil
				local before_init = nil
				if lsp_config ~= nil then
					settings = lsp_config.settings
					if lsp_config.before_init ~= nil then
						before_init = lsp_config.before_init()
					end
				end
				lspconfig[server_name].setup {
					capabilities = capabilities,
					before_init = before_init,
					on_attach = function(client, bufnr)
						on_lsp_attach(client, bufnr)
						if lsp_config ~= nil and lsp_config.on_attach ~= nil then
							lsp_config.on_attach(client, bufnr)
						end
					end,
					settings = settings
				}
			end,
			jdtls = function() end
		})



		for lsp, config in pairs(LSP_CONFIG) do
			if config['system'] ~= nil then
				local path = check_system(config['system'])
				if path ~= nil then
					local settings = nil
					local before_init = nil
					if config ~= nil then
						settings = config.settings
						if config.before_init ~= nil then
							before_init = config.before_init()
						end
					end

					lspconfig[lsp].setup {
						capabilities = capabilities,
						before_init = before_init,
						settings = settings,
						on_attach = function(client, bufnr)
							on_lsp_attach(client, bufnr)
							if config ~= nil and config.on_attach ~= nil then
								config.on_attach(client, bufnr)
							end
						end
					}
				end
			end
		end
	end
}

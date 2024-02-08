-- TODO: Make better

local LSP_CONFIG = require('lsp_config')

local function on_lsp_attach(client, bufnr)
	if vim.g.nightly then
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(bufnr, true)
		end
	else
		require('lsp-inlayhints').on_attach(client, bufnr)
	end
end

return {
	{
		'lvimuser/lsp-inlayhints.nvim',
		event = 'VeryLazy',
		opts = {
			inlay_hints = {
				highlight = "Comment"
			}
		},
		enabled = not vim.g.nightly
	},
	{
		'williamboman/mason-lspconfig.nvim',
		cond = vim.g.features.lsp,
		dependencies = {
			{
				'hrsh7th/cmp-nvim-lsp',
				name = 'cmp_nvim_lsp',
				cond = vim.g.features.lsp
			},
			{ 'williamboman/mason.nvim', },
			{ 'neovim/nvim-lspconfig', },
			{ 'lvimuser/lsp-inlayhints.nvim', enabled = not vim.g.nightly },
			{ 'SmiteshP/nvim-navbuddy' },
			{ 'SmiteshP/nvim-navic' }
		},
		config = function()
			local lspconfig = require('lspconfig')
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			require('mason-lspconfig').setup_handlers({
				function(server_name)
					local lsp_config = LSP_CONFIG[server_name]
					local settings = nil
					if lsp_config ~= nil then
						settings = lsp_config.settings
					end
					lspconfig[server_name].setup {
						capabilities = capabilities,
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
		end
	},

}

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
	'williamboman/mason-lspconfig.nvim',
	dependencies = {
		{
			'lvimuser/lsp-inlayhints.nvim',
			enabled = not vim.g.nightly,
			event = "VeryLazy",

			opts = {
				inlay_hints = {
					highlight = "Comment"
				}
			},
		},
		{ 'hrsh7th/cmp-nvim-lsp', },
		{ 'williamboman/mason.nvim', },
		{ 'neovim/nvim-lspconfig', },
		{ 'SmiteshP/nvim-navbuddy' },
		{ 'SmiteshP/nvim-navic' }
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
	end
}

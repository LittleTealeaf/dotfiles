return {
	'neovim/nvim-lspconfig',
	event = 'BufRead',
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		'williamboman/mason.nvim',
		'lukas-reineke/lsp-format.nvim',
		'simrat39/rust-tools.nvim',
		'simrat39/inlay-hints.nvim',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		require('mason').setup()
		require('mason-lspconfig').setup()
		require('lsp-format').setup()

		local lspconfig = require('lspconfig')

		local capabilities = require('cmp_nvim_lsp').default_capabilities()


		local on_attach = function(client, bufnr)
			require('lsp-format').on_attach(client)

			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			local keymap = vim.keymap.set
			keymap('n', 'K', vim.lsp.buf.hover, bufopts)
		end


		local lsp_flags = {
			-- This is the default in Nvim 0.7+
			debounce_text_changes = 150,
		}

		require('mason-lspconfig').setup_handlers({
			function(server_name)
				lspconfig[server_name].setup {
					on_attach = on_attach,
					flags = lsp_flags,
					capabilities = capabilities
				}
			end,
			rust_analyzer = function()
				require('rust-tools').setup({
					server = {
						on_attach = function(client, bufnr)
							on_attach(client, bufnr)
						end
					}
				})
			end,
			lua_ls = function()
				lspconfig['lua_ls'].setup({
					on_attach = on_attach,
					flags = lsp_flags,
					capabilities = capabilities,
					settings = {
						Lua = {
							hint = {
								enable = true
							}
						}
					}
				})
			end
		})


		-- lspconfig['pyright'].setup {
		-- 	on_attach = on_attach,
		-- 	flags = lsp_flags,
		-- 	capabilities = capabilities,
		-- }
		--
		-- lspconfig['tsserver'].setup {
		-- 	-- → typescript.inlayHints.variableTypes.enabled                                    default: false
		-- 	on_attach = on_attach,
		-- 	flags = lsp_flags,
		-- 	capabilities = capabilities,
		-- 	settings = {
		-- 				['typescript.inlayHints.variableTypes.enabled'] = true
		-- 	}
		-- }
		--
		-- lspconfig['html-lsp'].setup {
		-- 	on_attach = on_attach,
		-- 	flags = lsp_flags,
		-- 	capabilities = capabilities,
		-- 	settings = {
		--
		-- 	}
		-- }
	end
}

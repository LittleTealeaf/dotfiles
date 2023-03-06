return {
	'neovim/nvim-lspconfig',
	event = 'BufRead',
	dependencies = {
		{
			'williamboman/mason-lspconfig.nvim',
			dependencies = { { 'williamboman/mason.nvim', config = true } },
			config = true
		},
		{ 'lukas-reineke/lsp-format.nvim', config = true },
		'simrat39/rust-tools.nvim',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
		-- { 'simrat39/inlay-hints.nvim',     opts = { only_current_line = false } },
		{ 'lvimuser/lsp-inlayhints.nvim',  opts = { inlay_hints = { highlight = "Comment" } }, config = true }
	},
	config = function()
		local lspconfig = require('lspconfig')

		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		local with_inlay = function(attach)
			return function(client, bufnr)
				require('lsp-inlayhints').on_attach(client, bufnr)
				attach(client, bufnr)
			end
		end


		local on_attach = function(client, bufnr)
			require('lsp-format').on_attach(client)

			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			local keymap = vim.keymap.set
			keymap('n', 'K', vim.lsp.buf.hover, bufopts)
		end


		local lsp_flags = {
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
						on_attach = on_attach
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
			end,
			tsserver = function()
				lspconfig.tsserver.setup({
					on_attach = with_inlay(on_attach),
					flags = lsp_flags,
					capabilities = capabilities,
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = 'all',
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							}
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = 'all',
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							}
						}
					}
				})
			end
		})
	end
}

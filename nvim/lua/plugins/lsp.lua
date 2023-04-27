local LSP_SETTINGS = {
	['lua_ls'] = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			},
			hint = {
				enable = true
			}
		}
	},
	['tsserver'] = {
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
	},
	['html'] = {
		html = {
			format = {
				indentInnerHtml = true
			}
		}
	},
	['yamlls'] = {
		yaml = {
			keyOrdering = false
		}
	}
}

local attach_inlay_hints = function(client, bufnr)
	require('lsp-inlayhints').on_attach(client, bufnr)
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
	},
	{ 'neovim/nvim-lspconfig', },
	{
		'williamboman/mason.nvim',
		opts = {
			ui = {
				border = 'rounded',
			}
		}
	},
	{
		'simrat39/rust-tools.nvim',
		ft = 'rust',
		config = true
	},
	{
		'jose-elias-alvarez/null-ls.nvim',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' }
		},
		opts = function()
			local null_ls = require('null-ls')
			return {
				sources = {
					null_ls.builtins.formatting.prettier,
				}
			}
		end,
		event = 'VeryLazy'
	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = {
			{
				'hrsh7th/cmp-nvim-lsp',
				name = 'cmp_nvim_lsp',
			},
			{ 'williamboman/mason.nvim', },
			{ 'neovim/nvim-lspconfig', },
			{ 'lvimuser/lsp-inlayhints.nvim' },
			{ 'SmiteshP/nvim-navbuddy' }
		},
		config = function()
			local lspconfig = require('lspconfig')
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			require('mason-lspconfig').setup_handlers({
				function(server_name)
					lspconfig[server_name].setup {
						capabilities = capabilities,
						on_attach = attach_inlay_hints,
						settings = LSP_SETTINGS[server_name]
					}
				end,
				jdtls = function()
					lspconfig.jdtls.setup({
						capabilities = capabilities,
					})
				end
			})
		end
	},
}

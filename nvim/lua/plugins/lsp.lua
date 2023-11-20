local LSP_CONFIG = {
	['lua_ls'] = {
		settigns = {
			Lua = {
				diagnostics = {
					globals = { 'vim' }
				},
				hint = {
					enable = true
				},
			}
		}
	},
	['tsserver'] = {
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
	},
	['html'] = {
		settings = {
			html = {
				format = {
					indentInnerHtml = true
				}
			}
		}
	},
	['yamlls'] = {
		settings = {
			yaml = {
				keyOrdering = false
			}
		}
	},
	['zls'] = {
		settings = {
			zig = {
				checkForUpdate = false,
				zls = {
					enableAstCheckDiagnostics = false,
				}
			}
		}
	},
}

local function on_lsp_attach(client, bufnr)
	if Nightly then
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint(bufnr, true)
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
		enabled = not Nightly
	},
	{ 'neovim/nvim-lspconfig', },
	{
		"saecki/crates.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvimtools/none-ls.nvim" }
		},
		opts = {
			null_ls = {
				enabled = true,
				name = "crates.nvim"
			}
		}
	},
	{
		'nvimtools/none-ls.nvim',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' }
		},
		opts = function()
			local null_ls = require('null-ls')
			return {
				sources = {
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.black
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
			{ 'lvimuser/lsp-inlayhints.nvim', enabled = not Nightly },
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

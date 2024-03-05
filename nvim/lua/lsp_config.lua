local config = {
	['lua_ls'] = {
		before_init = function()
			return require('neodev.lsp').before_init
		end,
		settings = {
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

local system_binaries = {
	pyright = 'pyright-langserver',
	clangd = 'clangd',
	bashls = 'bash-language-server',
	tsserver = 'typescript-language-server',
	texlab = 'texlab',
	['lua_ls'] = 'lua-language-server',
	gopls = 'gopls',
	['emmet_language_server'] = 'emmet-language-server',
	zls = 'zls',
	yamlls = 'yaml-language-server',
	vuels = 'vue-language-server',
	vimls = 'vim-language-server',
	taplo = 'taplo',
	csharp_ls = 'csharp-ls',
	cssls = 'vscode-css-language-server',
	html = 'vscode-html-language-server',
	jsonls = 'vscode-json-language-server',
	prismals = 'prisma-language-server',
	terraformls = 'terraform-ls',
}

for lsp, bin in pairs(system_binaries) do
	if config[lsp] == nil then
		config[lsp] = {}
	end
	config[lsp].system = {
		bin = bin
	}
end



return config

local config = {
	['lua_ls'] = {
		before_init = function()
			local success, neodev = pcall(require, 'neodev.lsp')
			if success then
				return neodev
			else
				return nil
			end
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
	['ts_ls'] = {
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
	pylsp = 'pylsp',
	clangd = 'clangd',
	bashls = 'bash-language-server',
	ts_ls = 'typescript-language-server',
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

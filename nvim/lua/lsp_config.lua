return {
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

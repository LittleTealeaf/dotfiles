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
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'akinsho/toggleterm.nvim',
		},
		ft = 'rust',
		config = function()
			local mason_registry = require('mason-registry')
			local codelldb = mason_registry.get_package('codelldb')
			local extension_path = codelldb:get_install_path() .. "/extension/"
			local this_os = vim.loop.os_uname().sysname;
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

			if this_os:find "Windows" then
				codelldb_path = extension_path .. "adapter\\codelldb.exe"
				liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
			else
				liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
			end

			require('rust-tools').setup({
				dap = {
					adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
				},
				server = {
					on_attach = function(_, bufnr)
						local rt = require('rust-tools')
						vim.keymap.set('n', '<leader>crr', rt.hover_actions.hover_actions, { buffer = bufnr })
						vim.keymap.set('n', '<leader>cra', rt.code_action_group.code_action_group, { buffer = bufnr })
						vim.keymap.set('n', '<leader>crd', require('rust-tools.debuggables').debuggables)
					end,
				},
				tools = {
					hover_actions = {
						auto_focus = true,
					}
				}
			})
		end
	},
	{
		"saecki/crates.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "jose-elias-alvarez/null-ls.nvim" }
		},
		opts = {
			null_ls = {
				enabled = true,
				name = "crates.nvim"
			}
		}
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

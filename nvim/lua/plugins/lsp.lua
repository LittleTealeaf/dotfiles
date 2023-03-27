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
	{
		'SmiteshP/nvim-navbuddy',
		dependencies = {
			{ "SmiteshP/nvim-navic", opts = { highlight = true } },
			"MunifTanjim/nui.nvim"
		},
		opts = {
			window = {
				border = "rounded",
				size = "75%",
				sections = {
					left = {
						size = "25%"
					},
					mid = {
						size = "50%"
					}
				}
			},
			lsp = {
				auto_attach = true
			},
			icons = {
				Boolean = "󰔡 "
			},
		},
		keys = {
			{ '<leader>cn', function() require('nvim-navbuddy').open() end, desc = "Open Navbuddy" }
		}
	},
	{
		'neovim/nvim-lspconfig',
		keys = {
			{ 'K', vim.lsp.buf.hover, }
		}
	},
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

			local attach_inlay_hints = function(client, bufnr)
				require('lsp-inlayhints').on_attach(client, bufnr)
			end

			require('mason-lspconfig').setup_handlers({
				function(server_name)
					lspconfig[server_name].setup {
						capabilities = capabilities,
						on_attach = attach_inlay_hints
					}
				end,
				lua_ls = function()
					lspconfig['lua_ls'].setup({
						on_attach = attach_inlay_hints,
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
						capabilities = capabilities,
						on_attach = attach_inlay_hints,
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
				end,
				jdtls = function()
					lspconfig.jdtls.setup({
						capabilities = capabilities,
					})
				end
			})
		end
	},
	{
		'glepnir/lspsaga.nvim',
		dependencies = {
			{ 'catppuccin/nvim',      name = 'catppuccin' },
			{ 'neovim/nvim-lspconfig' },
		},
		event = 'LspAttach',
		opts = function()
			local catppuccin_theme = require('catppuccin.groups.integrations.lsp_saga')
			return {
				finder = {
					keys = {
						expand_or_jump = '<cr>'
					}
				},
				symbol_in_winbar = {
					enable = false,
					color_mode = false,
					separator = ' '
				},
				lightbulb = {
					enable = false
				},
				outline = {
					enable = false
				},
				ui = {
					border = 'rounded',
					title = false,
					kind = catppuccin_theme.custom_kind()
				},
			}
		end,
		keys = {
			{ '<leader>cp',  '<cmd>Lspsaga peek_definition<CR>',       desc = 'Peek Definition' },
			{ '<leader>cq',  '<cmd>Lspsaga lsp_finder<CR>',            desc = 'LSP Finder' },
			{ '<leader>cr',  '<cmd>Lspsaga rename<CR>',                desc = 'Lsp Rename' },
			{ '<leader>cR',  '<cmd>LSpsaga rename ++project<CR>',      desc = "LSP Rename Project" },
			{ '<leader>cdl', '<cmd>Lspsaga show_line_diagnostics<CR>', desc = "Show line diagnostics" },
			{ '<leader>cdb', '<cmd>Lspsaga show_buf_diagnostics<CR>',  desc = "Show Buffer Diagnostics" },
		}
	},
	{
		'folke/trouble.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		opts = {
			auto_open = false,
			auto_close = true,
			action_keys = {
				jump = { '<tab>' },
				jump_close = { '<cr>', 'o' }
			},
		},
		keys = {
			{ '<leader>ct', '<cmd>TroubleToggle workspace_diagnostics<CR>', desc = "Toggle Trouble" }
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
					null_ls.builtins.diagnostics.flake8,
				}
			}
		end,
		event = 'VeryLazy'
	},
}

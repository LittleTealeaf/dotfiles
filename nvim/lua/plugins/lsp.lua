return {
	{
		'lvimuser/lsp-inlayhints.nvim',
		event = 'BufEnter',
		opts = {
			inlay_hints = {
				highlight = "Comment"
			}
		},
	},
	{
		'neovim/nvim-lspconfig',
		keys = {
			{ 'K', vim.lsp.buf.hover, }
		}
	},
	{ 'williamboman/mason.nvim', config = true },
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
				name = 'cmp_nvim_lsp'
			},
			{ 'williamboman/mason.nvim', },
			{ 'neovim/nvim-lspconfig', },
			{ 'lvimuser/lsp-inlayhints.nvim' },
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
		lazy = false,
		opts = function()
			local catppuccin_theme = require('catppuccin.groups.integrations.lsp_saga')
			return {
				symbol_in_winbar = {
					color_mode = false,
					separator = ' '
				},
				lightbulb = {
					enable = false
				},
				ui = {
					border = 'rounded',
					kind = catppuccin_theme.custom_kind()
				},
				outline = {
					auto_close = false
				}
			}
		end,
		keys = {
			{ '<leader>cp', '<cmd>Lspsaga peek_definition<CR>', desc = 'Peek Definition' },
			{ '<leader>cd', '<cmd>Lspsaga lsp_finder<CR>',      desc = 'LSP Finder' },
			{ '<leader>cr', '<cmd>Lspsaga rename<CR>',          desc = 'Lsp Rename' },
		}
	},
	{
		'folke/trouble.nvim',
		dependencies = {
			'kyazdani42/nvim-web-devicons',
		},
		opts = {},
		keys = {
			{ '<leader>ct', ':TroubleToggle workspace_diagnostics<CR>', desc = "Toggle Trouble" }
		}
	}
}

return {
  {
    'lvimuser/lsp-inlayhints.nvim',
    event = 'BufEnter',
    opts = {
      inlay_hints = {
        highlight = "Comment"
      }
    },
    config = function()
      vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
      vim.api.nvim_create_autocmd("LspAttach", {
        group = "LspAttach_inlayhints",
        callback = function(args)
          if not (args.data and args.data.client_id) then
            return
          end

          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          require("lsp-inlayhints").on_attach(client, bufnr)
        end,
      })
    end
  },

  {
    'neovim/nvim-lspconfig',
    keys = {
      { 'K', vim.lsp.buf.hover, }
    }
  },
  { 'williamboman/mason.nvim', config = true },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      {
        'hrsh7th/cmp-nvim-lsp',
        name = 'cmp_nvim_lsp'
      },
      { 'simrat39/rust-tools.nvim' },
      { 'williamboman/mason.nvim', },
    },
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()


      require('mason-lspconfig').setup_handlers({
        function(server_name)
          lspconfig[server_name].setup {
            capabilities = capabilities
          }
        end,
        rust_analyzer = function()
          require('rust-tools').setup({
            server = {
            }
          })
        end,
        lua_ls = function()
          lspconfig['lua_ls'].setup({
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
  }
}

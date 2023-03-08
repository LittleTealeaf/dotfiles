return {
  {
    'rcarriga/nvim-notify',
    dependnecies = {
      'MunifTanjim/nui.nvim',
    },
    opts = {
      timeout = 500,
      background_colour = '#000000',
      stages = 'fade',
      fps = 60,
      render = 'minimal'
    },
  },
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify'
    },
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
          ['vim.lsp.util.stylize_markdown'] = false,
          ['cmp.entry.get_documentation'] = false,
        }
      },
      cmdline = {
        view = 'cmdline',
        format = {
          cmdline = {
            icon = ">"
          }
        }
      },
      views = {
        nofity = {
          replace = true
        },
        messages = {
          view = 'popup'
        }
      },
      routes = {
        filter = {
          event = "msg_show",
          kind = "search_count",
        },
        opts = {
          skip = true
        }
      },
      notify = {
        enabled = true,
        view = "notify"
      }
    }
  }
}

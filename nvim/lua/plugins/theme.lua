return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  init = function()
    -- load the colorscheme here
    vim.cmd([[colorscheme catppuccin]])
  end,
  opts = {
    flavor = "macchiato",
    transparent_background = true,
    integrations = {
      neotree = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
      noice = true,
      notify = true,
      markdown = true,
      mason = true,
      cmp = true,
      lsp_saga = true,
      native_lsp = {
        enabled = true,
        virutal_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' }
        },
        underlines = {
          errors = { 'underline' },
          hints = { 'underline' },
          warnings = { 'underline' },
          information = { 'underline' }
        }
      }
    },
    dim_inactive = {
      enabled = false,
    },
    styles = {

    },
    custom_highlights = function(colors)
      return {
				TelescopeBorder = {fg = colors.surface1, bg = ''},
				CatBorder = {fg = colors.surface1, bg = ''},

				-- Tabline
				tabline_a_normal_bold_italic = {fg = colors.blue, bg = '', style = {'bold', 'italic'}},
				tabline_b_normal_bold_italic = {fg = colors.text, bg = '', style = {'bold', 'italic'}},
				tabline_a_normal_italic = {fg = colors.blue, bg = '', style = {'italic'}},
				tabline_b_normal_italic = {fg = colors.text, bg = '', style = {'italic'}},
				tabline_a_normal_bold = {fg = colors.blue, bg = '', style = {'bold'}},
				tabline_b_normal_bold = {fg = colors.text, bg = '', style = {'bold'}},
				tabline_a_normal = {fg = colors.blue, bg = ''},
				tabline_b_normal = {fg = colors.text, bg = ''},
      }
    end
  },
}

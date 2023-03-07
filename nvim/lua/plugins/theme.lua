return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
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
      percentage = 0.70
    },
    styles = {

    }
  }
}

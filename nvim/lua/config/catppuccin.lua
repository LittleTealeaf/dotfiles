require("catppuccin").setup({
  flavor = "macchiato",
  transparent_background = true,
  integrations = {
    telescope = true,
    neotree = true,
    treesitter = true,
  },
  dim_inactive = {
    enabled = false,
    percentage = 0.70
  },
  styles = {

  }
})

vim.cmd([[colorscheme catppuccin]])

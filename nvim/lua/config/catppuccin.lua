require("catppuccin").setup({
  flavor = "macchiato",
  transparent_background = true,
  integrations = {
    telescope = true,
    treesitter = true,
		dashboard = true,
		neotree = true
  },
  dim_inactive = {
    enabled = false,
    percentage = 0.70
  },
  styles = {

  }
})

vim.cmd([[colorscheme catppuccin]])

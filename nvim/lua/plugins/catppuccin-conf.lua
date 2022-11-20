local catppuccin = require("catppuccin")
catppuccin.setup({
  flavor = "mocha",
  transparent_background = true
})

vim.cmd([[
  colorscheme catppuccin
]])

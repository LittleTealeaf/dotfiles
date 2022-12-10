require('catppuccin').setup({
  flavor = "macchiato",
	transparent_background = true,
	integrations = {
		telescope = true,
		neotree = true,
		treesitter = true,
		dashboard = true
	},

})

vim.cmd([[
  colorscheme catppuccin
]])

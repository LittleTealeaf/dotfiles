require('catppuccin').setup({
  flavor = "macchiato",
	transparent_background = true,
	integrations = {
		telescope = true,
		nvimtree = true,
		treesitter = true,
		dashboard = true
	},

})

vim.cmd([[
  colorscheme catppuccin
]])

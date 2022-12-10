require('catppuccin').setup({
  flavor = "macchiato",
	transparent_background = true,
	integrations = {
		telescope = true,
		neotree = true,
		treesitter = true,
		dashboard = true
	},
	dim_inactive = {
		enabled = false,
		percentage = 0.70,
	},
	styles = {
		comments = {"italic"},
		conditionals = {"italic"},
		functions = {"bold"},
		strings = {"italic"},
		variables = {},
		types = {},
		operators = {},
		loops = {},
		keywords = {},
		properties = {}
	}
})

vim.cmd([[
  colorscheme catppuccin
]])

return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = true,
	config = function()
		require("catppuccin").setup({
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
		})
	end
}

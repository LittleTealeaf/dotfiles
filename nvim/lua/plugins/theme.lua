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
		term_colors = true,
		integrations = {
			gitsigns = true,
			lsp_saga = true,
			markdown = true,
			mason = true,
			neotree = true,
			noice = true,
			cmp = true,
			notify = true,
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
			},
			treesitter_context = true,
			treesitter = true,
			telescope = true,
		},
		dim_inactive = {
			enabled = false,
		},
		styles = {

		},
		custom_highlights = function(colors)
			local border = { fg = colors.surface1, bg = '' }
			local selection = { bg = colors.surface1, style = { 'bold' } }
			return {
				-- Border
				TelescopeBorder = border,
				CatBorder = border,
				FloatBorder = border,
				HoverBorder = border,
				RenameBorder = border,
				SagaBorder = border,
				LspInfoBorder = border,
				NeoTreeFloatBorder = border,
				NoiceConfirmBorder = border,
				-- Noice
				NoiceMini = { fg = '', bg = '' },
				-- Neotree
				NeoTreeCursorLine = selection,
				-- Tabline
				tabline_a_normal_bold_italic = { fg = colors.blue, bg = '', style = { 'bold', 'italic' } },
				tabline_b_normal_bold_italic = { fg = colors.text, bg = '', style = { 'bold', 'italic' } },
				tabline_a_normal_italic = { fg = colors.blue, bg = '', style = { 'italic' } },
				tabline_b_normal_italic = { fg = colors.text, bg = '', style = { 'italic' } },
				tabline_a_normal_bold = { fg = colors.blue, bg = '', style = { 'bold' } },
				tabline_b_normal_bold = { fg = colors.text, bg = '', style = { 'bold' } },
				tabline_a_normal = { fg = colors.blue, bg = '' },
				tabline_b_normal = { fg = colors.text, bg = '' },
			}
		end
	},
}

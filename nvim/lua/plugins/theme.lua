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
			-- treesitter_context = true,
			treesitter = true,
			telescope = true,
			navic = {
				enabled = true,
			},
		},
		dim_inactive = {
			enabled = false,
		},
		styles = {

		},
		custom_highlights = function(colors)
			local border = { fg = colors.surface1, bg = '' }
			local selection = { bg = colors.surface1, style = { 'bold' } }
			local title = { fg = colors.blue, style = { 'bold' } }

			return {
				-- -- Tabline
				-- tabline_a_normal_bold_italic = { fg = colors.blue, bg = '', style = { 'bold', 'italic' } },
				-- tabline_b_normal_bold_italic = { fg = colors.text, bg = '', style = { 'bold', 'italic' } },
				-- tabline_a_normal_italic = { fg = colors.blue, bg = '', style = { 'italic' } },
				-- tabline_b_normal_italic = { fg = colors.text, bg = '', style = { 'italic' } },
				-- tabline_a_normal_bold = { fg = colors.blue, bg = '', style = { 'bold' } },
				-- tabline_b_normal_bold = { fg = colors.text, bg = '', style = { 'bold' } },
				-- tabline_a_normal = { fg = colors.blue, bg = '' },
				-- tabline_b_normal = { fg = colors.text, bg = '' },
				TabLineSel = {fg = colors.blue, bg = ''},
				TabLine = {fg = colors.text, bg = ''},
				-- NeoTree
				NeoTreeFloatBorder = border,
				NeoTreeCursorLine = selection,
				-- Telescope
				TelescopeBorder = border,
				TelescopeTitle = title,
				TelescopeSelection = { fg = colors.text, bg = colors.surface1, style = { 'bold' } },
				-- Borders
				FloatBorder = border,
				HoverBorder = border,
				RenameBorder = border,
				-- LspSaga
				SagaShadow = { bg = '' },
				SagaBorder = border,
				DiagnosticBorder = border,
				DiagnosticShowBorder = border,
				-- Navbuddy
				NavbuddyFloatBorder = border,
				-- Noice
				NoiceMini = { fg = '', bg = '' },
				NoiceConfirmBorder = border,
				-- Lsp
				LspInfoBorder = border,
				-- Glance
				GlanceListCursorLine = selection,
			}
		end
	},
}

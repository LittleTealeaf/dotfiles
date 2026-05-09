vim.pack.add({
	'https://github.com/catppuccin/nvim'
})

local catppuccin = require('catppuccin')


local function custom_highlights(c)
	return {

		-- Floats
		Float = { bg = c.surface0 },
		NormalFloat = { bg = c.surface0 },
		NvimFloat = { bg = c.surface0 },
		FloatBorder = { fg = c.surface0, bg = c.surface0 },
		FloatTitle = { bg = c.surface0, fg = c.text, style = { 'bold' } },
	}
end

local function transparent_override(c, highlights)
	local overrides = {
		LualineRecording = { fg = c.mauve, bg = '', style = { 'bold' } },

		NormalFloat = { bg = '' },
		Float = { bg = '' },
		NoicePopup = { bg = '' },

		FloatBorder = { fg = c.surface1, bg = '' },

		TroubleNormal = { bg = '' },
		LspInfoBorder = { fg = c.text, bg = '' },
		CursorLine = { bg = '' },

		NoiceMini = { bg = '' },
		WhichKeyFloat = { bg = '' },
	}

	for k, v in pairs(overrides) do
		highlights[k] = v
	end

	return highlights
end

catppuccin.setup({
	flavour = "mocha",
	transparent_background = Transparent,
	term_colors = true,
	show_end_of_buffer = false,
	integrations = {
		gitsigns = true,
		markdown = true,
		cmp = true,
		flash = true,
		dap = true,
		dap_ui = true,
		snacks = {
			enabled = true
		},
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
		treesitter = true,
	},
	custom_highlights = function(c)
		if Transparent and BorderedWindows then
			return transparent_override(c, custom_highlights(c))
		else
			return custom_highlights(c)
		end
	end
})

vim.cmd([[colorscheme catppuccin]])

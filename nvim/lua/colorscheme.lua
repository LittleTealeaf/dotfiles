vim.pack.add({
	Github('catppuccin/nvim')
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

		-- Lualine
		LualineRecording = { fg = c.mauve, bg = c.mantle, style = { 'bold' } },

		-- Modicator
		NormalMode = { fg = c.blue },
		InsertMode = { fg = c.green },
		VisualMode = { fg = c.mauve },
		ReplaceMode = { fg = c.red },
		CommandMode = { fg = c.teal },
		SelectMode = { fg = c.red },

		-- Trouble
		TroubleNormal = { bg = c.mantle },

		NormalFloatAlt = { bg = c.mantle },
		FloatBorderAlt = { bg = c.mantle, fg = c.mantle },

		-- Autocomplete
		Pmenu = { bg = c.surface0 },
		PmenuSel = { bg = c.surface1 },

		-- DAP UI
		DapUIFloatBorder = { bg = c.mantle, fg = c.mantle },
		DapUINormalFloat = { bg = c.mantle },
		DapUIFloatNormal = { bg = c.mantle },
		DapStoppedLine = { bg = c.surface1 },
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

		NormalFloatAlt = { bg = '' },
		FloatBorderAlt = { bg = '', fg = c.mantle },
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
		local highlights = custom_highlights(c)
		if Transparent and BorderedWindows then
			return transparent_override(c, highlights)
		else
			return highlights
		end
	end
})

vim.cmd([[colorscheme catppuccin]])

local function custom_highlights(c)
	return {
		-- flash
		FlashPrompt = { bg = c.mantle },

		-- Win Separator
		WinSeparator = { fg = c.surface0 },

		-- Modicator
		NormalMode = { fg = c.blue },
		InsertMode = { fg = c.green },
		VisualMode = { fg = c.mauve },
		ReplaceMode = { fg = c.red },
		CommandMode = { fg = c.teal },
		SelectMode = { fg = c.red },

		-- Lualine
		LualineRecording = { fg = c.mauve, bg = c.mantle, style = { 'bold' } },

		-- Tabline
		TabLine = { bg = c.mantle },
		TabLineFill = { bg = c.mantle },

		-- Float
		Float = { bg = c.surface0 },
		NormalFloat = { bg = c.surface0 },
		NvimFloat = { bg = c.surface0 },
		FloatBorder = { fg = c.surface0, bg = c.surface0 },
		FloatTitle = { bg = c.surface0, fg = c.text, style = { 'bold' } },

		-- Toggle Term
		ToggleTermNormal = { bg = c.mantle },
		ToggleTermBorder = { bg = c.mantle, fg = c.mantle },

		-- Hovers
		HoverBorder = { fg = c.base, bg = c.base },
		RenameBorder = { fg = c.base, bg = c.base },

		-- Trouble
		TroubleNormal = { bg = c.mantle },

		-- Telescope
		TelescopeBorder = { bg = c.mantle, fg = c.mantle },
		TelescopeTitle = { fg = c.text, style = { 'bold' } },
		TelescopeNormal = { bg = c.mantle },
		TelescopeSelection = { fg = c.text, bg = c.surface1, style = { 'bold' } },

		TelescopeResultsDiffAdd = { fg = c.green, bg = '' },
		TelescopeResultsDiffDelete = { fg = c.red, bg = '' },
		TelescopeResultsDiffChange = { fg = c.text, bg = '' },
		TelescopeResultsDiffUntracked = { fg = c.surface0, bg = '' },

		-- Noice
		NoiceMini = { fg = '', bg = '' },
		NoiceConfirmBorder = { bg = c.mantle, fg = c.mantle },
		NoicePopup = { fg = c.text, bg = c.surface0 },

		-- Lsp
		LspInfoBorder = { bg = c.mantle, fg = c.mantle },

		-- Glance
		GlanceListCursorLine = { bg = c.surface1, style = { 'bold' } },

		-- End of Buffer Lines
		EndOfBuffer = { fg = c.surface1 },

		-- Lazy Git
		LazyGitBorder = { bg = c.mantle, fg = c.mantle },
		LazyGitFloat = { bg = c.mantle },

		-- Harpoon
		HarpoonBorder = { bg = c.mantle, fg = c.mantle },
		HarpoonWindow = { bg = c.mantle },

		-- Trouble
		TroubleNormalNC = { bg = c.mantle },


		-- DAP UI
		DapUIFloatBorder = { bg = c.mantle, fg = c.mantle },
		DapUINormalFloat = { bg = c.mantle },
		DapUIFloatNormal = { bg = c.mantle },
		DapStoppedLine = { bg = c.surface1 },

		-- Registers
		RegistersYank = { fg = c.pink },
		RegistersDelete = { fg = c.red },
		RegistersHistory = { fg = c.sapphire },
		RegistersAlternateBuffer = { fg = c.peach },
		RegistersSearch = { fg = c.yellow }
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


return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false, -- make sure we load this during startup if it is your main scheme

	init = function()
		-- load the scheme here
		vim.cmd([[colorscheme catppuccin]])
	end,
	opts = {
		flavour = "mocha",
		transparent_background = Transparent,
		term_colors = true,
		show_end_of_buffer = false,
		integrations = {
			gitsigns = true,
			markdown = true,
			mason = true,
			noice = true,
			cmp = true,
			flash = true,
			notify = true,
			harpoon = true,
			which_key = true,
			dap = true,
			dap_ui = true,
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
			telescope = true,
		},
		custom_highlights = function(c)
			if Transparent then
				return transparent_override(c, custom_highlights(c))
			else
				return custom_highlights(c)
			end
		end
	},
}

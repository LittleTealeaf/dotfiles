return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false, -- make sure we load this during startup if it is your main ccheme
	init = function()
		-- load the ccheme here
		vim.cmd([[colorscheme catppuccin]])
	end,
	opts = {
		flavor = "macchiato",
		transparent_background = false,
		term_c = true,
		integrations = {
			gitsigns = true,
			markdown = true,
			mason = true,
			neotree = false,
			noice = true,
			cmp = true,
			flash = true,
			notify = true,
			harpoon = true,
			which_key = true,
			dap = {
				enabled = true,
				enable_ui = true,
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
			telescope = true,
			navic = {
				enabled = true,
			},
		},
		dim_inactive = {
			enabled = false,
		},
		custom_highlights = function(c)
			return {
				-- Modicator
				NormalMode = { fg = c.blue },
				InsertMode = { fg = c.green },
				VisualMode = { fg = c.mauve },
				ReplaceMode = { fg = c.red },
				CommandMode = { fg = c.teal },
				SelectMode = { fg = c.red },

				-- Lualine
				LualineRecording = { fg = c.mauve, bg = c.mantle, style = { 'bold' } },
				LualineNavic = { bg = c.mantle },

				-- Navic
				NavicText = { fg = c.text },

				-- Tabline
				TabLine = { bg = c.mantle },
				TabLineFill = { bg = c.mantle },

				-- Float
				Float = { bg = c.surface0 },
				NormalFloat = { bg = c.surface0 },
				NvimFloat = { bg = c.surface0 },
				FloatBorder = { fg = c.surface0, bg = c.surface0 },

				-- Toggle Term
				ToggleTermNormal = {bg = c.mantle},
				ToggleTermBorder = {bg = c.mantle, fg = c.mantle},

				-- Hovers
				HoverBorder = { fg = c.base, bg = c.base },
				RenameBorder = { fg = c.base, bg = c.base },

				-- Telescope
				TelescopeBorder = { bg = c.mantle, fg = c.mantle },
				TelescopeTitle = { fg = c.text, style = { 'bold' } },
				TelescopeNormal = { bg = c.mantle },
				TelescopeSelection = { fg = c.text, bg = c.surface1, style = { 'bold' } },

				-- Navbuddy
				NavbuddyFloatBorder = { fg = c.base, bg = c.base },
				NavbuddyNormalFloat = { bg = c.mantle },

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

				-- Harpoon
				HarpoonBorder = { bg = c.mantle, fg = c.mantle },
				HarpoonWindow = { bg = c.mantle },

				-- CursorLine
				CursorLine = { bg = '', style = { 'bold' } },

				-- DAP UI
				DapUIFloatBorder = { bg = c.mantle, fg = c.mantle },
				DapStoppedLine = { bg = c.surface1 },

				-- Registers
				RegistersYank = { fg = c.pink },
				RegistersDelete = { fg = c.red },
				RegistersHistory = { fg = c.sapphire },
				RegistersAlternateBuffer = { fg = c.peach },
				RegistersSearch = { fg = c.yellow }
			}
		end
	},
}



-- local function transparent_theme(c)
-- 	local border = Transparent and { fg = c.surface1, bg = '' } or { fg = c.base, bg = '' }
-- 	local selection = { bg = c.surface1, style = { 'bold' } }
-- 	local title = { fg = c.blue, style = { 'bold' } }
-- 	return {
-- 		-- Modicator
-- 		NormalMode = { fg = c.blue },
-- 		InsertMode = { fg = c.green },
-- 		VisualMode = { fg = c.mauve },
-- 		ReplaceMode = { fg = c.red },
-- 		CommandMode = { fg = c.teal },
-- 		SelectMode = { fg = c.red },
--
-- 		-- Lualine
-- 		LualineRecording = { fg = c.mauve, bg = Transparent and '' or c.mantle, style = { 'bold' } },
-- 		LualineNavic = { bg = Transparent and '' or c.mantle },
--
-- 		-- Navic
-- 		NavicText = { fg = c.text },
--
-- 		-- Tabline
-- 		TabLine = { bg = Transparent and '' or c.mantle },
-- 		TabLineFill = { bg = Transparent and '' or c.mantle },
--
-- 		-- Float
-- 		Float = { bg = Transparent and '' or c.surface0 },
-- 		NormalFloat = { bg = Transparent and '' or c.surface0 },
-- 		NvimFloat = { bg = Transparent and '' or c.surface0 },
--
-- 		-- NeoTree
-- 		NeoTreeFloatBorder = border,
-- 		NeoTreeCursorLine = selection,
--
-- 		-- Telescope
-- 		TelescopeBorder = Transparent and border or { bg = c.mantle, fg = c.mantle },
-- 		TelescopeTitle = Transparent and title or { fg = c.text, style = { 'bold' } },
-- 		TelescopeNormal = { bg = Transparent and c.base or c.mantle },
-- 		TelescopeSelection = { fg = c.text, bg = Transparent and '' or c.surface1, style = { 'bold' } },
--
-- 		-- Borders
-- 		FloatBorder = border,
-- 		HoverBorder = border,
-- 		RenameBorder = border,
--
-- 		-- Navbuddy
-- 		NavbuddyFloatBorder = border,
-- 		NavbuddyNormalFloat = { bg = Transparent and '' or c.mantle },
--
-- 		-- Noice
-- 		NoiceMini = { fg = '', bg = '' },
-- 		NoiceConfirmBorder = border,
-- 		NoicePopup = { fg = c.text, bg = c.surface0 },
--
-- 		-- Lsp
-- 		LspInfoBorder = border,
--
-- 		-- Glance
-- 		GlanceListCursorLine = selection,
--
-- 		-- End of Buffer Lines
-- 		EndOfBuffer = { fg = c.surface1 },
--
-- 		-- LazyGit
-- 		LazyGitBorder = border,
--
-- 		-- Harpoon
-- 		HarpoonBorder = border,
--
-- 		-- Cursor Line
-- 		CursorLine = { bg = '', style = { 'bold' } },
--
-- 		-- Dap UI
-- 		DapUIFloatBorder = border,
-- 		DapStoppedLine = selection,
--
-- 		-- Registers
-- 		RegistersYank = { fg = c.pink },
-- 		RegistersDelete = { fg = c.red },
-- 		RegistersHistory = { fg = c.sapphire },
-- 		RegistersAlternateBuffer = { fg = c.peach },
-- 		RegistersSearch = { fg = c.yellow },
-- 	}
-- end

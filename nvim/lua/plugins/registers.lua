return {
	{
		'tversteeg/registers.nvim',
		opts = function()
			local registers = require('registers')
			return {
				window = {
					border = 'rounded',
					transparency = 0,
				},
				sign_highlights = {
					cursorlinesign = "CursorLine",
					signcolumn = "NormalFloat",
					cursorline = "Visual",
					selection = "Constant",
					default = "",
					unnamed = "",
					read_only = "",
					expression = "",
					black_hole = "",
					alternate_buffer = "RegistersAlternateBuffer",
					last_search = "RegistersSearch",
					delete = "RegistersDelete",
					yank = "RegistersYank",
					history = "RegistersHistory",
					named = ""
				},
				bind_keys = {
					['<Tab>'] = registers.move_cursor_down(),
					['<S-Tab>'] = registers.move_cursor_up(),
				}
			}
		end
	}
}

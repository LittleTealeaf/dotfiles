return {
	'huynle/ogpt.nvim',
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim"
	},
	opts = {
		default_provider = 'gemini',
		providers = {
			gemini = {
				api_key = os.getenv('GEMINI_API_KEY'),
			}
		},
	},
	cond = os.getenv('GEMINI_API_KEY') ~= nil,
	keys = {
		{ '<leader>gi', ':OGPT<CR>', desc = "Gemini" },
	}
}

local function use_api(action)
	return function()
		require('LspUI').api[action]()
	end
end

return {
	"jinzhongjia/LspUI.nvim",
	event = "VeryLazy",
	branch = "legacy",
	opts = {
		peek_definition = {
			enable = true
		},
		prompt = false
	},
	keys = {
		{ '<leader>cn', '<CMD>LspUI rename<CR>',    desc = "Lsp Rename" },
		{ '<leader>cp', use_api('peek_definition'), desc = "Peek Definition" },
	}
}

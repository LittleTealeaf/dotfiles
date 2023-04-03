local function use_api(action)
	return function()
		require('LspUI').api[action]()
	end
end


return {
	"jinzhongjia/LspUI.nvim",
	event = "VeryLazy",
	opts = {
		peek_definition = {
			enable = true
		}
	},
	keys = {
		{ '<leader>cn', '<cmd>LspUI rename<CR>',    desc = "Lsp Rename" },
		{ '<leader>cp', use_api('peek_definition'), desc = "Peek Definition" }
	}
}

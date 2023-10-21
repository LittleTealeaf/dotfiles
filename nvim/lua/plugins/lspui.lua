local function use_api(action)
	return function()
		require('LspUI').api[action]()
	end
end

-- peek_definition
-- hover
-- rename
-- code_action
-- diagnostic

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
		{ '<leader>cn', use_api('rename'),          desc = "LSP Rename" },
		{ '<leader>cp', use_api('peek_definition'), desc = "Peek Definition" },
	}
}

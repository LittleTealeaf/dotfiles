local M = {}


function M.setup()
	vim.api.nvim_create_user_command('Tree', 'NvimTreeToggle',{})
end


return M

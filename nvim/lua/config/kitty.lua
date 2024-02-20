local ENV_HOME = tostring(os.getenv("HOME"))

local function update_title()
	local path = string.gsub(vim.fn.getcwd() or 0, ENV_HOME, '~')
	os.execute('kitty @ set-tab-title " ' .. path .. '"')
end

if os.getenv('TERM') == 'xterm-kitty' then
	update_title()

	vim.api.nvim_create_autocmd('DirChanged', {
		callback = update_title
	})
	vim.api.nvim_create_autocmd('VimLeave', {
		callback = function()
			os.execute('kitty @ set-tab-title')
		end
	})
end

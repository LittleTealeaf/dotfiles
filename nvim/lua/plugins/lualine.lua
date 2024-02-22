local ENV_HOME = tostring(os.getenv("HOME"))

local function get_current_path()
	local path = string.gsub(vim.fn.getcwd() or 0, ENV_HOME, '~')
	path = string.gsub(path, '~/dev/', ' ')
	return path
end

local function is_recording()
	local name = vim.api.nvim_call_function('reg_recording', {})
	return name ~= ''
end

local function get_recording_name()
	return "Recording @" .. vim.api.nvim_call_function('reg_recording', {})
end


local function empty_if_nil(func)
	return function()
		local item = func()
		if item ~= nil then
			return item
		else
			return ""
		end
	end
end

return {
	{
		'nvim-lualine/lualine.nvim',
		name = 'lualine',
		dependencies = {
			{ 'stevearc/oil.nvim' },
			{ 'folke/noice.nvim', },
			{ 'nvim-tree/nvim-web-devicons', },
			{ 'SmiteshP/nvim-navic' },
			-- { 'mfussenegger/nvim-dap',       cond = vim.g.features.dap }
		},
		opts = function()
			local noice = require('noice')
			return {
				extensions = { 'lazy', 'toggleterm', 'trouble', 'nvim-dap-ui', 'mason', 'oil' },
				options = {
					globalstatus = true,
					theme = 'catppuccin',
					disabled_filetypes = {
						statusline = {
							'TelescopePrompt',
							'neo-tree',
							'toggleterm',
							'lazygit',
						}
					},
					section_separators = {
						left = '',
						right = ''
					},
					component_separators = {
						left = '',
						right = ''
					}
				},
				sections = {
					lualine_a = {
						{
							'mode',
						}
					},
					lualine_b = {
						{
							'filename',
							newfile_status = true,
							path = 1,
							symbols = {
								unnamed = '',
								modified = '󰳼 ',
								readonly = ' ',
								newfile = ' '
							}
						},
					},
					lualine_c = {
						{ 'diff' },
					},
					lualine_x = {
						{
							'diagnostics',
							update_in_insert = true,
						},
						{
							get_recording_name,
							cond = is_recording,
							color = 'LualineRecording',
						},
						{
							noice.api.status.search.get_hl,
							cond = noice.api.status.search.has
						},
						{
							noice.api.status.command.get_hl,
							cond = noice.api.status.command.has
						},
					},
					lualine_y = {
						{ 'branch' },
					},
					lualine_z = {
						{
							get_current_path,
						}
					},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {
					lualine_c = {
						{
							"navic",
							color_correction = 'static',
							navic_opts = nil,
						},
					},
				}
			}
		end
	}
}

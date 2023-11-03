local ENV_HOME = tostring(os.getenv("HOME"))

local function get_current_path()
	local path = string.gsub(vim.fn.getcwd(), ENV_HOME, '~')
	path = string.gsub(path, '~/dev/', ' ')
	return path
end

local function get_number_of_buffers()
	local count = 0
	for _, _ in pairs(vim.fn.getbufinfo({ buflisted = 1 })) do
		count = count + 1
	end
	if count > 1 then
		return tostring(count)
	end
	return ""
end

local function is_recording()
	local name = vim.api.nvim_call_function('reg_recording', {})
	return name ~= ''
end

local function get_recording_name()
	return "Recording @" .. vim.api.nvim_call_function('reg_recording', {})
end


return {
	{
		'nvim-lualine/lualine.nvim',
		name = 'lualine',
		dependencies = {
			{ 'folke/noice.nvim', },
			{ 'nvim-tree/nvim-web-devicons', },
			{ 'SmiteshP/nvim-navic' }
		},
		opts = function()
			local noice = require('noice')
			return {
				extensions = { 'lazy', 'neo-tree', 'toggleterm', 'trouble', 'nvim-dap-ui', 'mason' },
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
						-- left = '',
						-- right = ''
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
							-- separator = { left = '', right = '' }
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
								readonly = ' ',
								newfile = ' '
							}
						},
					},
					lualine_c = {
						-- {
						-- 	get_number_of_buffers
						-- },
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
							-- separator = { left = '', right = '' }
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

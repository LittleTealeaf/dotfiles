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

return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			{ 'stevearc/oil.nvim' },
			{ 'folke/noice.nvim', },
			{ 'nvim-tree/nvim-web-devicons', },
			{ 'folke/trouble.nvim' },
		},
		opts = function()
			local noice = require('noice')
			local trouble = require('trouble')

			local trouble_symbols = trouble.statusline({
				mode = "lsp_document_symbols",
				groups = {},
				title = false,
				filter = { range = true },
				format = "{kind_icon}{symbol.name:Normal}",
				hl_group = "lualine_c_normal"
			})


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
							trouble_symbols.get,
							cond = trouble_symbols.has
						}
					}
				}
			}
		end
	}
}

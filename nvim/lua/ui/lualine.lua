vim.pack.add({ Github('nvim-lualine/lualine.nvim') })

local lualine = require('lualine')

local ENV_HOME = tostring(os.getenv('HOME'))

local function get_current_path()
	local path = string.gsub(vim.fn.getcwd() or 0, ENV_HOME, '~')
	path = string.gsub(path, '~/dev/', ' ')
	path = string.gsub(path, '~/git/', ' ')
	return path
end

local function is_recording()
	local name = vim.api.nvim_call_function('reg_recording', {})
	return name ~= ''
end

local function get_recording_name()
	return "Recording @" .. vim.api.nvim_call_function('reg_recording', {})
end

lualine.setup({
	extensions = { 'trouble', 'oil' },
	options = {
		globalstatus = true,
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
				'lsp_status',
				icon = '',
				symbols = {
					spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
					done = '✓',
					separator = ' ',
				},
				ignore_lsp = {},
				show_name = true,
			},
			{
				'diagnostics',
				update_in_insert = true,
			},
			{
				get_recording_name,
				cond = is_recording,
				color = 'LualineRecording',
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
})

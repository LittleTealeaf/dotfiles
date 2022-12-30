local g = vim.g
local cmd = vim.cmd
local api = vim.api
local create_command = api.nvim_create_user_command



g.coc_global_extensions = {
	'coc-marketplace',
	'coc-git',
}
g.coc_config_home = "$DOT_FILES/nvim"


create_command("Format","call CocAction('format')",{})
create_command("Fold","call CocAction('fold', <f-args>)", {nargs = '?'})

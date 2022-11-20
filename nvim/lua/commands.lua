local user_command = vim.api.nvim_create_user_command

user_command("Format", "call CocAction('format')", {})
user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

local user_command = vim.api.nvim_create_user_command

local tabline = require("tabline")

user_command("Format", "call CocAction('format')", {})
user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

user_command(
  'Tabn',
  function(input)
    tabline.tab_rename(input.args)
  end,
  {nargs = 1}
)

user_command(
  'ShowAllBuffers',
  function()
    tabline.toggle_show_all_buffers()
  end,
  {}
)

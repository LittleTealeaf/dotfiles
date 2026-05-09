require("nvim-treesitter-textobjects").setup({
  select = {
    enable = true,
    lookahead = true,
    include_surrounding_whitespace = false,
  }
})

local ts_select = require("nvim-treesitter-textobjects.select")

local maps = {
  ['ia'] = '@assignment.inner',
  ['aa'] = '@assignment.outer',
  ['iA'] = '@attribute.inner',
  ['aA'] = '@attribute.outer',
  ['ib'] = '@block.inner',
  ['ab'] = '@block.outer',
  ['iC'] = '@call.inner',
  ['aC'] = '@call.outer',
  ['ic'] = '@class.inner',
  ['ac'] = '@class.outer',
  ['i3'] = '@comment.inner',
  ['a3'] = '@comment.outer',
  ['ii'] = '@conditional.inner',
  ['ai'] = '@conditional.outer',
  ['iF'] = '@frame.inner',
  ['aF'] = '@frame.outer',
  ['if'] = '@function.inner',
  ['af'] = '@function.outer',
  ['il'] = '@loop.inner',
  ['al'] = '@loop.outer',
  ['in'] = '@number.inner',
  ['iP'] = '@parameter.inner',
  ['aP'] = '@parameter.outer',
  ['ir'] = '@regex.inner',
  ['ar'] = '@regex.outer',
  ['is'] = '@scopename.inner',
  ['as'] = '@statement.outer',
}

for key, query in pairs(maps) do
  vim.keymap.set({ "x", "o" }, key, function()
    ts_select.select_textobject(query, "textobjects")
  end)
end

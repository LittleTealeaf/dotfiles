require("nvim-tree").setup({
  sort_by = "case_sensitive"
})

vim.api.nvim_create_user_command('Tree', 'NvimTreeToggle',{})

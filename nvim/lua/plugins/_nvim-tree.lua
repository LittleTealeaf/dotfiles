require("nvim-tree").setup({
	hijack_netrw = true,
  sort_by = "case_sensitive"
})

vim.api.nvim_create_user_command('Tree', 'NvimTreeToggle',{})


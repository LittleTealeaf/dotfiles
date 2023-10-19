# TODO

Yet another rewrite of plugins / setup, use features like init functions and such:


```lua
{
    "cshuaimin/ssr.nvim",
    -- init is always executed during startup, but doesn't load the plugin yet.
    init = function()
      vim.keymap.set({ "n", "x" }, "<leader>cR", function()
        -- this require will automatically load the plugin
        require("ssr").open()
      end, { desc = "Structural Replace" })
    end,
  },
```


- Add https://github.com/folke/zen-mode.nvim


```lua
-- create directories when needed, when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match

    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    local backup = vim.fn.fnamemodify(file, ":p:~:h")
    backup = backup:gsub("[/\\]", "%%")
    vim.go.backupext = backup
  end,
})
```

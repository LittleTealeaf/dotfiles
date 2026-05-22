-- ~/.config/nvim/lsp/pyright.lua

return {
  cmd = { 'pyright-langserver', '--stdio' },
	filetypes = {'python'},
  -- Root markers tell Neovim where your project workspace begins
  root_markers = { 'pyproject.toml', 'uv.lock', '.git' },

  -- Native client properties must start as structured tables
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
      },
    },
  },

  -- This hook intercepts the configuration right before the server spawns
  before_init = function(params, config)
    local root_dir = config.root_dir
    local python_path = 'python' -- Default fallback

    -- Check if a local virtual environment managed by uv exists
    if root_dir and vim.uv.fs_stat(root_dir .. '/.venv/bin/python') then
      python_path = root_dir .. '/.venv/bin/python'
    end

    -- Mutate the static settings table dynamically before initialization
    config.settings.python = config.settings.python or {}
    config.settings.python.pythonPath = python_path
  end,

  -- Hook up your debugger package attachments using native pack controls
  on_attach = function(client, bufnr)
    vim.pack.add({
      Github('mfussenegger/nvim-dap-python'),
      Github('mfussenegger/nvim-dap'),
    })
    
    -- Initialize the Python debugger package safely
    pcall(function()
      require('dap-python').setup()
    end)
  end,
}

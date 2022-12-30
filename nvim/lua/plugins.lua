local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

require('packer').startup(function(use)
  use {"wbthomason/packer.nvim"}

  --Terminal
  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = [[require('config.toggleterm')]]
  }

  -- Search
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-frecency.nvim",
      "nvim-telescope/telescope-ui-select.nvim"
    },
    config = [[require('config.telescope')]]
  }

  -- Theme
  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = [[require("config.catppuccin")]]
  }

  use {'wakatime/vim-wakatime'}
end)

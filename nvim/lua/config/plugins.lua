require("packer").startup(function(use)
  use {"wbthomason/packer.nvim"}


  -- EDITING

  use {
    "neoclide/coc.nvim",
    branch = "release"
  }

  use {
    "jiangmiao/auto-pairs"
  }

  -- APPEARANCE

  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("config.plugins.catppuccin")
    end

  }

  use {
    "nvim-tree/nvim-tree.lua",
    requires = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require("config.plugins.tree")
    end
  }

  use {
    "nvim-lualine/lualine.nvim",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require("config.plugins.lualine")
    end
  }


  -- SOCIAL

  use {"wakatime/vim-wakatime"}


end)

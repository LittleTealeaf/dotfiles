local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git',
      'clone',
      '--depth', '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)

  use {"wbthomason/packer.nvim"}

  -- PERFORMANCE

  use {"nvim-lua/plenary.nvim", module="plenary"}


  -- LANDING PAGE

  use {
    "glepnir/dashboard-nvim",
    config = function()
      require("plugins.dashboard-conf")
    end
  }

  -- WORKSPACE

  use {
    "nvim-tree/nvim-tree.lua",
    requires = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require("plugins.nvim-tree-conf")
    end
  }

  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("plugins.toggleterm-conf")
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    tag='0.1.0',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim'
    },
    config = function()
      require("plugins.telescope-conf")
    end
  }

  use {
    'nvim-telescope/telescope-file-browser.nvim',
    after = 'telescope.nvim',
    config = function()
      require("telescope").load_extension("file_browser")
    end
  }

  use {
    'nvim-telescope/telescope-github.nvim',
    after = 'telescope.nvim',
    config = function()
      require("telescope").load_extension("gh")
    end
  }

  use {
    'LukasPietzschmann/telescope-tabs',
    after = 'telescope.nvim',
    config = function()
      require("telescope").load_extension("telescope-tabs")
    end
  }

  use {
    'MattesGroeger/vim-bookmarks',
    config = function()
      require("plugins/bookmarks-conf")
    end
  }

  use {
    'tom-anders/telescope-vim-bookmarks.nvim',
    after = {
      "vim-bookmarks",
      "telescope.nvim"
    },
    config = function()
      require("telescope").load_extension("vim_bookmarks")
    end
  }

  use {
    'kdheepak/tabline.nvim',
    requires = {
      'hoob3rt/lualine.nvim',
      'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require("plugins.tabline-conf")
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {"kyazdani42/nvim-web-devicons",opt=true},
    config = function()
      require("plugins.lualine-conf")
    end
  }

  -- GIT
  use {"tpope/vim-fugitive"}

  -- EDITING

  use {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      require("plugins.coc-conf")
    end
  }

  use {"othree/xml.vim"}

  use {"nvim-treesitter/nvim-treesitter"}

  -- APPEARANCE

  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("plugins.catppuccin-conf")
    end
  }

  -- MISC

  use {"wakatime/vim-wakatime"}
  use {"andweeb/presence.nvim"}
  use {"normen/vim-pio"}
end)

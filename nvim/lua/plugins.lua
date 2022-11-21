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
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use {"wbthomason/packer.nvim"}

  -- LANDING PAGE
  use {
    "glepnir/dashboard-nvim",
    config = function()
      require("plugins._dashboard")
    end
  }

  -- PERFORMANCE

  -- WORKSPACE

  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins._nvim-tree")
    end
  }

  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("plugins._toggleterm")
    end
  }

  use {
    'MattesGroeger/vim-bookmarks',
    config = function()
      require("plugins._bookmarks")
    end
  }

  use {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.0',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-github.nvim',
      'LukasPietzschmann/telescope-tabs',
      'tom-anders/telescope-vim-bookmarks.nvim'
    },
    after = {
      'vim-bookmarks'
    },
    config = function()
        require("plugins._telescope")
    end
  }

  use {
    "kdheepak/tabline.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
    }
  }

  use {
    "nvim-lualine/lualine.nvim",
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    after = {"tabline.nvim"},
    config = function()
      require("plugins._lualine")
    end
  }

  -- GIT

  use {"tpope/vim-fugitive"}

  -- EDITING

  use {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      require("plugins._coc")
    end
  }

--  use {"othree/xml.vim"}

  use {"nvim-treesitter/nvim-treesitter", run=":TSUpdate"}

  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("plugins._catppuccin")
    end
  }


  use {"wakatime/vim-wakatime"}
  use {"andweeb/presence.nvim"}

  use {"normen/vim-pio"}

end)

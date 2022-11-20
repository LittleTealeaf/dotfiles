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
      -- REQUIRES
    end
  }

  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      -- CONFIG
    end
  }

  



end)

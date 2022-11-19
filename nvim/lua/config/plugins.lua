require("packer").startup(function(use)
  use {"wbthomason/packer.nvim"}

  -- PERFORMANCE
  use {"nvim-lua/plenary.nvim", module = "plenary"}


  -- WORKSPACE
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("config.plugins.nvim-tree")
    end

  }

	use {
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("config.plugins.toggleterm")
		end
	}

  -- EDITING

  use {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      require("config.plugins.coc")
    end
  }

  use {
    "jiangmiao/auto-pairs"
  }

	use {
		"othree/xml.vim"
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
    "nvim-lualine/lualine.nvim",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require("config.plugins.lualine")
    end
  }


  -- SOCIAL

  use {"wakatime/vim-wakatime"}


	-- PROJECT BASE
	
	use {"normen/vim-pio"}

end)

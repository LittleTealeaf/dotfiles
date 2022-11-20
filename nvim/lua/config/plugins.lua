require("packer").startup(function(use)
  use {"wbthomason/packer.nvim"}

	-- LANDING PAGE
	use {
		"glepnir/dashboard-nvim",
		config = function()
			require("config.plugins.dashboard")
		end
	}

  -- PERFORMANCE
	use {"nvim-lua/plenary.nvim", module = "plenary"}

	use {
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end
	}

	use {
		"nvim-lua/popup.nvim"
	}

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

	use {
		'nvim-telescope/telescope.nvim',
		tag='0.1.0',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-lua/popup.nvim',
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-github.nvim",
		},
		config = function()
			require("config.plugins.telescope")
		end
	}

	use {
		'kdheepak/tabline.nvim',
		requires = {
			'hoob3rt/lualine.nvim',
			'kyazdani42/nvim-web-devicons'
		},
		config = function()
			require("config.plugins.tabline")
		end
	}

	-- git
	use {
		"tpope/vim-fugitive"
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

	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
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

	use {"andweeb/presence.nvim"}

	-- PROJECT BASE
	use {"normen/vim-pio"}

end)

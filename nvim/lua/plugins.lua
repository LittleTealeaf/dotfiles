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
		after = {
			"coc.nvim",
			"auto-session",
			"vim-bookmarks",
		},
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-github.nvim",
			"fannheyward/telescope-coc.nvim",
			"tom-anders/telescope-vim-bookmarks.nvim",
			"cljoly/telescope-repo.nvim",
      "rmagatti/session-lens",
			"nvim-telescope/telescope-packer.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
			}
    },
    config = [[require('config.telescope')]]
  }

  -- Theme
  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = [[require("config.catppuccin")]]
  }

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
		after = {
			'noice.nvim'
		},
    requires = {
      'kyazdani42/nvim-web-devicons',
      'kdheepak/tabline.nvim'
    },
    config = [[require("config.lualine")]]
  }

  -- Neo Tree
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    },
    config = [[require("config.neo-tree")]]
  }

	-- Coc
	use {
		'neoclide/coc.nvim',
		branch = 'release',
		config = [[require('config.coc')]]
	}

	-- Incremental Search
	use {'haya14busa/is.vim'}

	-- Git
	use {'tpope/vim-fugitive'}

	-- Number Toggle
	use {'jeffkreeftmeijer/vim-numbertoggle'}

	-- XML
	use {'othree/xml.vim'}

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run=":TSUpdate",
		config = [[require('config.treesitter')]]
	}

	-- Wakatime
  use {'wakatime/vim-wakatime'}

	-- Auto Sessions
	use {
		'rmagatti/auto-session',
		config = [[require("config.auto-session")]]
	}

	-- Bookmarks
	use {
		"MattesGroeger/vim-bookmarks",
		config = [[require("config.vim-bookmarks")]]
	}

	-- Dashboard
	use {
		"glepnir/dashboard-nvim",
		config = [[require("config.dashboard")]]
	}


	-- CSS Colors
	use {"norcalli/nvim-colorizer.lua", config=[[require('config.colorizer')]]}

	-- nvim notify
	use {"rcarriga/nvim-notify", config=[[require('config.nvim-notify')]]}

	-- Noice
	use {
		"folke/noice.nvim",
		requires={'MunifTanjim/nui.nvim'},
		config=[[require('config.noice')]]
	}

	-- Markdown Preview
	use {
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = {"markdown"}
		end,
		ft = {
			"markdown"
		},
		config = [[require('config.markdown-preview')]]
	}


	-- Discord Rich Presence
	use {
		"andweeb/presence.nvim",
		config = [[require('config.presence')]]
	}

	-- Repl
	use {
		"pappasam/nvim-repl",
		requires = {
			"tpope/vim-repeat"
		},
		config = [[require('config.nvim-repl')]]
	}
end)

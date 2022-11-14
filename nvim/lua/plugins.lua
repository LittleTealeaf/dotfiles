local M = {}

function M.setup()
  local packer_bootstrap = false

  local conf = {
    profile = {
      enable = true,
      threshold = -1
    },
    display = {
      open_fn = function()
        return require("packer.util").float {border = "rounded"}
      end
    }
  }

  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
      })
      vim.cmd([[packadd packer.nvim]])
    end
    vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
  end

  local function plugins(use)
    -- Autoupdate
    use { "wbthomason/packer.nvim"}

    -- Load uplugins only when needed
    use {"nvim-lua/plenary.nvim", module = "plenary"}

    use {"lewis6991/impatient.nvim"}

    use {"neoclide/coc.nvim", branch = "release"}

    use {"jiangmiao/auto-pairs"}

		use {
			"nvim-tree/nvim-tree.lua",
			requires = {
				"nvim-tree/nvim-web-devicons"
			},
			config = function()
				require("nvim-tree").setup({
					sort_by = "case_sensitive",
					offsets = {
						filetype = "NvimTree",
						text = "File Explorer" | function ,
						text_align = "left" | "center" | "right",
						separator = true
					}
				})
			end

		}	

		use {"wakatime/vim-wakatime"}

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
        require("lualine").setup({
          options = {
          theme = "codedark"
          }
        })
      end
    }

    use {
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        require("catppuccin").setup({
          flavor = "mocha",
          transparent_background = true
        })
      end
    }

		use {
			'akinsho/bufferline.nvim', 
			tag = "v3.*", 
			requires = 'nvim-tree/nvim-web-devicons',
			config = function()
				require("bufferline").setup({})
			end
		}

--		use {
--  		'romgrk/barbar.nvim',
--  		requires = {'kyazdani42/nvim-web-devicons'}
--		}

  end

  local packer = require("packer")
  packer.init(conf)
  packer.startup(plugins)

	
end

return M

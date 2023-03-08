return {
  {
    'kdheepak/tabline.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons'
    },
    name = 'tabline',
    opts = {
      enable = false,
      options = {
        section_separators = {'',''},
        component_separators = { '', '' }
      }
    },
    keys = {
      {
        '<A-[>',
        function()
          require('tabline').buffer_previous()
        end
      },
      {
        '<A-]>',
        function()
          require('tabline').buffer_next()
        end
      }
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    name = 'lualine',
    dependencies = {
      { 'kyazdani42/nvim-web-devicons' },
      {
        'kdheepak/tabline.nvim',
        name = 'tabline'
      }
    },
    opts = function()
      return {
        extensions = { 'nvim-dap-ui', 'neo-tree', 'toggleterm', 'fzf', 'fugitive', 'aerial' },
        options = {
          theme = 'catppuccin',
          section_separators = {
            left = '',
            right = ''
          },
          component_separators = {
            left = ''
          }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {},
          lualine_c = {
						{'filename'},
						{'diff'}
					},
          lualine_x = {
						{'diagnostics'},
						{'filetype'},
					},
          lualine_y = {
					},
          lualine_z = { 'location' },
        },
        tabline = {
          lualine_a = { '' },
          lualine_b = {},
          lualine_c = { require('tabline').tabline_buffers },
          lualine_x = { '' },
          lualine_y = { '' },
          lualine_z = { '' },
        }
      }
    end
  }
}

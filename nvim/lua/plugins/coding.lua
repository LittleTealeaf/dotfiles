return {
  {
    'windwp/nvim-autopairs',
    dependnecies = { 'cmp' },
    event = 'VeryLazy',
    config = function()
      require('nvim-autopairs').setup()

      require('cmp').event:on(
        'confirm_done',
        require('nvim-autopairs.completion.cmp').on_confirm_done()
      )
    end
  },
  {
    'windwp/nvim-ts-autotag',
    dependnecies = { 'nvim-treesitter/nvim-treesitter' },
    event = 'VeryLazy',
    config = true,
  }

}

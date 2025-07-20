return {
  'code-biscuits/nvim-biscuits',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  },
  keys = {
    {
      '<leader>cb',
      function()
        require('nvim-biscuits').toggle_biscuits()
      end,
      desc = 'Toggle biscuits, returrn values',
    },
  },
}

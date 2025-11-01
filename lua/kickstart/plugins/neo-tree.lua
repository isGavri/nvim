-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    'folke/snacks.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>e', ':Neotree toggle right<CR>', desc = 'NeoTree toggle left', silent = true },
    { '<leader>be', ':Neotree buffers<CR>', desc = 'NeoTree open boffers', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        width = 25,
        mappings = {},
      },
    },
  },
}

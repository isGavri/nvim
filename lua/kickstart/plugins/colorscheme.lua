return {
  {
    'zenbones-theme/zenbones.nvim',
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.zenbones_darken_comments = 45
      vim.cmd.colorscheme 'zenbones'
    end,
  },
  {
    'folke/tokyonight.nvim',
    -- priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      -- vim.cmd.colorscheme 'retrobox'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

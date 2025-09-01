return {
  {
    'zenbones-theme/zenbones.nvim',
    dependencies = 'rktjmp/lush.nvim',
    -- lazy = false,
    -- priority = 1000,
    config = function()
      vim.g.zenbones_darken_comments = 45
      vim.cmd.colorscheme 'zenbones'

      vim.api.nvim_set_hl(0, 'Normal', { bg = '#0A0E08', nocombine = true })
    end,
  },
  {
    'folke/tokyonight.nvim',
    -- lazy = false,
    -- priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'tokyonight'
    end,
  },

  {
    'rjshkhr/shadow.nvim',
    -- lazy = false,
    -- priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      -- vim.cmd.colorscheme 'shadow'
    end,
  },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- hard, medium, soft
      vim.g.gruvbox_material_background = 'hard'
      -- material, mix, original
      vim.g.gruvbox_material_foreground = 'material'
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_mateial_dim_inactive_windows = 1
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_enable_italic = true
      -- vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    -- lazy = false,
    -- priority = 1000,
    config = function()
      require('kanagawa').setup {
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        transparent = false, -- do not set background color
        dimInactive = true, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}

        -- wave, dragon, lotus
        theme = 'wave',
        background = {
          dark = 'wave',
          light = 'lotus',
        },
      }

      -- setup must be called before loading
      -- vim.cmd.colorscheme 'kanagawa'
    end,
  },
  {
    'neanias/everforest-nvim',
    -- lazy = false,
    -- priority = 1000,
    config = function()
      local everforest = require 'everforest'
      everforest.setup {
        background = 'medium',
        transparent_background_level = 0,
        italics = true,
        disable_italic_comments = false,
        inlay_hints_background = 'dimmed',
        on_highlights = function(hl, _)
          hl['@string.special.symbol.ruby'] = { link = '@field' }
        end,
      }
      -- everforest.load()
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

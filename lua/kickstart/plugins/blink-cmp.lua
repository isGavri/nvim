return {
  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'InsertEnter',
    version = '1.*',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              local ls = require 'luasnip'

              ls.config.set_config {
                enable_autosnippets = true,
                store_selection_keys = '<Tab>',
              }
              -- Uncomment for latex snippets
              require('luasnip.loaders.from_lua').load { paths = { '~/snippets/' } }

              vim.keymap.set({ 'i', 's' }, '<C-L>', function()
                ls.jump(1)
              end, { silent = true })
              vim.keymap.set({ 'i', 's' }, '<C-J>', function()
                ls.jump(-1)
              end, { silent = true })
              -- Uncomment for friendly-snippets
              require('luasnip.loaders.from_vscode').lazy_load()
              local list_snips = function()
                local ft_list = require('luasnip').available()[vim.o.filetype]
                local ft_snips = {}
                for _, item in pairs(ft_list) do
                  ft_snips[item.trigger] = item.name
                end
                print(vim.inspect(ft_snips))
              end

              vim.api.nvim_create_user_command('SnipList', list_snips, {})
            end,
          },
        },
        opts = {},
        config = function()
          vim.api.nvim_create_autocmd('FileType', {
            pattern = 'tex',
            callback = function()
              require('luasnip.loaders.from_lua').load { paths = { '$HOME/snippets/' } }
            end,
          })
        end,
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      enabled = function()
        local disabled_filetype = {}
        return not vim.tbl_contains(disabled_filetype, vim.bo.filetype)
      end,
      keymap = {
        -- 'default' (recommended) for mappings similar to built-in completions
        --   <c-y> to accept ([y]es) the completion.
        --    This will auto-import if your LSP supports it.
        --    This will expand snippets if the LSP sent a snippet.
        -- 'super-tab' for tab to accept
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- For an understanding of why the 'default' preset is recommended,
        -- you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        --
        -- All presets have the following mappings:
        -- <tab>/<s-tab>: move to right/left of your snippet expansion
        -- <c-space>: Open menu or open docs if already open
        -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
        -- <c-e>: Hide menu
        -- <c-k>: Toggle signature help
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        preset = 'default',
        ['<tab>'] = false,
        ['<S-tab>'] = false,
        ['<C-l>'] = { 'snippet_forward', 'fallback' },
        ['<C-h>'] = { 'snippet_backward', 'fallback' },

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'normal',
      },

      completion = {
        -- By default, you may press `<c-space>` to show the documentation.
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        menu = { auto_show = true },
        keyword = { range = 'prefix' },
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
        list = {
          selection = { preselect = true, auto_insert = false },
        },
        ghost_text = { enabled = false },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },

      snippets = {
        preset = 'luasnip',
      },

      -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
      -- which automatically downloads a prebuilt binary when enabled.
      --
      -- By default, we use the Lua implementation instead, but you may enable
      -- the rust implementation via `'prefer_rust_with_warning'`
      --
      -- See :h blink-cmp-config-fuzzy for more information
      fuzzy = { implementation = 'lua' },

      -- Shows a signature help window while you type arguments for a function
      signature = { enabled = true },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et

return {
  'lervag/vimtex',
  lazy = false,
  dependencies = {},
  init = function()
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_view_forward_search_on_start = false
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = '/home/notsy/.texfiles',
      -- out_dir = '/home/notsy/.texfiles',
    }
  end,
}

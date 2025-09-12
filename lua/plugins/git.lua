return {
  --- git gutters
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '±' },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 100,
      },
    }
  },

  -- git diffs
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
}

return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
      'antosha417/nvim-lsp-file-operations',
      'folke/snacks.nvim',
    },
    lazy = false, -- neo-tree will lazily load itself
    opts = {
      window = {
        position = 'float',
      },
    },
    keys = {
      { '<F1>', '<cmd>Neotree source=filesystem toggle=true<cr>', silent=true },
      { '<F2>', '<cmd>Neotree source=buffers toggle=true<cr>', silent=true },
      { '<F3>', '<cmd>Neotree source=git_status toggle=true<cr>', silent=true },
    },
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { '<c-p>', '<cmd>FzfLua files<cr>', silent=true },
      { '<c-g>', '<cmd>FzfLua live_grep<cr>', silent=true },
      { '<leader>r', '<cmd>FzfLua resume<cr>', silent=true },
    },
    opts = {},
  },
}

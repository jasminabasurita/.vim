return {
  --- Filesystem browser, Buffer browser, Git status browser
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
      buffers = {
        show_unloaded = true,
      },
    },
    keys = {
      { '<F1>', '<cmd>Neotree source=filesystem toggle=true<cr>', silent = true },
      { '<F2>', '<cmd>Neotree source=buffers toggle=true<cr>', silent = true },
      { '<F3>', '<cmd>Neotree source=git_status toggle=true<cr>', silent = true },
      --- Open vim configs
      { '<leader>ev', '<cmd>Neotree dir=~/.vim/<cr>', silent = true },
    },
  },

  --- Fuzzy file finder
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = 'FzfLua',
    keys = {
      {
        '<c-p>',
        function()
          require('fzf-lua').global()
        end,
        silent = true,
      },
      { '<c-g>', '<cmd>FzfLua live_grep<cr>', silent = true },
      { '<leader>r', '<cmd>FzfLua resume<cr>', silent = true },
      { '<leader>sh', '<cmd>FzfLua helptags<cr>', silent = true, desc = 'Search help tags' },
      {
        'grr',
        function()
          require('fzf-lua').lsp_references()
        end,
        { desc = 'List all references' },
      },
    },
    opts = {},
  },

  --- Session Manager
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {},
  },
}

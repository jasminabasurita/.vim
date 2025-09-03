return {
  --- adds keymaps to surround text in matching pairs
  {
    'kylechui/nvim-surround',
    version = '^3.0.0', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    opts = {},
  },
  --- Automatically add closing pairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      check_ts = true,
    },
  },
  {
    'windwp/nvim-ts-autotag',
    lazy = false,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      opts = {
        -- Defaults
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
      },
    },
  },
  --- Delete buffers without breaking layouts
  {
    'famiu/bufdelete.nvim',
    keys = {
      { '<leader>q', '<cmd>:Bdelete<cr>', { desc = 'Delete current buffer'} }
    }
  }
}

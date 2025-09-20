return {
  -- copilot inline suggestions
  {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = '<C-j>',
          accept_line = '<C-l>',
          accept_word = '<C-k>',
          -- next = "<C-n>",
          -- prev = "<M-[>",
          dismiss = '<C-e>',
        },
      },
    },
  },

  -- AI chat
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MeanderingProgrammer/render-markdown.nvim',
    },
    keys = {
      { '<F4>', '<cmd>CodeCompanionChat Toggle<cr>', desc = 'Open Code Companion' },
    },
    opts = {
      display = {
        chat = {
          window = {
            width = 45,
          },
        },
      },
    },
  },
}

return {
  {
    'quentingruber/pomodoro.nvim',
    cmd = 'PomodoroStart',
    opts = {
      start_at_launch = false,
      work_duration = 25,
      break_duration = 5,
      delay_duration = 1, -- The additionnal work time you get when you delay a break
      long_break_duration = 15,
      breaks_before_long = 4,
      display_ui_on_break = true, -- Disable it if you only want to see the lualine
    },
  },
  {
    'oliver-hughes/md-list.nvim',
    opts = {},
  },
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    lazy = true,
    cmd = 'Obsidian',
    event = {
      'BufReadPre ' .. vim.fn.expand('~') .. '/Documents/Obsidian Vault/*.md',
      'BufNewFile ' .. vim.fn.expand('~') .. '/Documents/Obsidian Vault/*.md',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
      'ibhagwan/fzf-lua',
      'nvim-treesitter/nvim-treesitter',
      'MeanderingProgrammer/render-markdown.nvim',
    },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      workspaces = {
        {
          name = 'Obsidian Vault',
          path = '~/Documents/Obsidian Vault',
        },
      },
      picker = { name = 'fzf-lua' },
      attachments = {
        img_folder = '/assets',
      },
      ui = { enable = false },
      checkbox = {
        order = { ' ', '/', 'x', '-', '>', '<' },
      },
      legacy_commands = false,
      templates = {
        folder = '05 - Templates',
      },
      daily_notes = {
        folder = '02 - Dailies',
        template = 'Daily',
      },
      frontmatter = { enabled = false },
    },
  },
}

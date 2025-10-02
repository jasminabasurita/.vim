return {
  --- colorscheme
  {
    'rose-pine/neovim',
    enabled = true,
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme rose-pine-moon')
    end,
  },
  {
    'Mofiqul/dracula.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('dracula')
    end,
  },

  ---highlight color definitions (e.g. #844631)
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {},
  },

  --- statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'AndreM222/copilot-lualine',
      'quentingruber/pomodoro.nvim',
    },
    opts = {
      sections = {
        lualine_x = {
          { 'copilot', show_colors = true },
          'encoding',
          'fileformat',
          'filetype',
          function()
            return require('pomodoro').get_pomodoro_status('🍅❌', '🍅', '☕')
          end,
        },
      },
    },
  },

  --- bufferline
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        separator_style = 'thick',
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level)
          local icon = level:match('error') and ' ' or (level:match('warning') and ' ' or ' ')
          return ' ' .. icon .. count
        end,
        numbers = 'ordinal',
      },
    },
  },

  --- indentation guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      -- indent = { highlight = 'DraculaSubtle' },
      -- scope = { highlight = 'DraculaOrange' },
    },
  },

  --- greeter
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')

      dashboard.section.header.val = require('assets.rat')

      dashboard.section.buttons.val = {
        dashboard.button('o', '󰂺  > Open session for cwd', function()
          require('persistence').load()
        end),
        dashboard.button('b', '󰂻  > Browse sessions', function()
          require('persistence').select()
        end),
        dashboard.button('e', '  > New file', ':ene<cr>'),
        dashboard.button('f', '  > Find file', ':FzfLua files<cr>'),
        dashboard.button('t', '󰙅  > File tree', ':Neotree source=filesystem<cr>'),
        dashboard.button('p', '  > Plugins', ':Lazy<cr>'),
        dashboard.button('s', '  > Settings', ':Neotree dir=~/.vim<cr>'),
        dashboard.button('q', '  > Quit', ':qa<cr>'),
      }

      alpha.setup(dashboard.config)
    end,
  },

  --- markdown
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown', 'codecompanion' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      completions = {
        lsp = { enabled = true },
      },
      checkbox = {
        checked = { highlight = 'Comment', scope_highlight = 'Comment' },
        custom = {
          -- adding checkbox support for Obsidian Multi State CheckBox Switcher
          -- basic
          incomplete = { raw = '[/]', rendered = '󱎖 ', highlight = 'DiagnosticInfo' },
          canceled = {
            raw = '[-]',
            rendered = '󰍵 ',
            highlight = 'Comment',
            scope_highlight = '@text.strike',
          },
          forwarded = { raw = '[>]', rendered = '󰒊 ', highlight = 'DiagnosticHint' },
          scheduling = { raw = '[<]', rendered = ' ', highlight = 'DiagnosticInfo' },
          -- extras
          question = { raw = '[?]', rendered = ' ', highlight = 'DiagnosticError' },
          important = { raw = '[!]', rendered = ' ', highlight = 'DiagnosticWarn' },
          star = { raw = '[*]', rendered = '󰓎 ', highlight = 'DiagnosticWarn' },
          quote = { raw = '["]', rendered = ' ', highlight = 'DiagnosticInfo' },
          location = { raw = '[l]', rendered = ' ', highlight = 'DiagnosticError' },
          bookmark = { raw = '[b]', rendered = '󰃀 ', highlight = 'DiagnosticOk' },
          information = { raw = '[i]', rendered = '󰙎 ', highlight = 'DiagnosticInfo' },
          savings = { raw = '[s]', rendered = ' ', highlight = 'DiagnosticOk' },
          idea = { raw = '[I]', rendered = '󰛨 ', highlight = 'DiagnosticWarn' },
          pros = { raw = '[p]', rendered = ' ', highlight = 'DiagnosticOk' },
          cons = { raw = '[c]', rendered = ' ', highlight = 'DiagnosticError' },
          fire = { raw = '[f]', rendered = '󰈸 ', highlight = 'DiagnosticError' },
          key = { raw = '[k]', rendered = ' ', highlight = 'DiagnosticWarn' },
          win = { raw = '[w]', rendered = ' ', highlight = 'DiagnosticHint' },
          up = { raw = '[u]', rendered = '󰔵 ', highlight = 'DiagnosticOk' },
          down = { raw = '[d]', rendered = '󰔳 ', highlight = 'DiagnosticError' },
          todo = { raw = '[t]' },
        },
      },
    },
  },

  -- lazy.nvim
  {
    'folke/snacks.nvim',
    ---@module 'snacks'
    ---@type snacks.Config
    opts = {
      statuscolumn = {
        enabled = true,
        folds = {
          open = true,
          git_hl = true,
        },
      },
      image = {
        backend = 'kitty',
        resolve = function(path, src)
          if require('obsidian.api').path_is_note(path) then
            return require('obsidian.api').resolve_image_path(src)
          end
        end,
      },
    },
  },
}

return {
  --- colorscheme
  {
    'dracula/vim',
    name = 'dracula',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[
        colorscheme dracula
        highlight NonText guifg='#ABB2BF' gui=italic
        highlight DraculaCommentItalic ctermfg='61' guifg='#6272a4' gui=italic cterm=italic
        highlight DraculaCommentStrikethrough ctermfg='61' guifg='#6272a4' gui=strikethrough cterm=strikethrough
        highlight! link Comment DraculaCommentItalic
        "highlight Difftext ctermbg=NONE guibg=NONE
      ]])
    end,
  },
  {
    'catppuccin/nvim',
    enabled = false,
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('catppuccin-mocha')
    end,
  },
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
  {
    'folke/tokyonight.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('tokyonight-storm')
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
          incomplete = { raw = '[/]', rendered = '󱎖 ', highlight = 'DraculaPink' },
          canceled = {
            raw = '[-]',
            rendered = '󰍵 ',
            highlight = 'DraculaComment',
            scope_highlight = 'DraculaCommentStrikethrough',
          },
          forwarded = { raw = '[>]', rendered = '󰒊 ', highlight = 'DraculaPurple' },
          scheduling = { raw = '[<]', rendered = ' ', highlight = 'DraculaPurple' },
          -- extras
          question = { raw = '[?]', rendered = ' ', highlight = 'DraculaYellow' },
          important = { raw = '[!]', rendered = ' ', highlight = 'DraculaOrange' },
          star = { raw = '[*]', rendered = '󰓎 ', highlight = 'DraculaYellow' },
          quote = { raw = '["]', rendered = ' ', highlight = 'DraculaCyan' },
          location = { raw = '[l]', rendered = ' ', highlight = 'DraculaRed' },
          bookmark = { raw = '[b]', rendered = '󰃀 ', highlight = 'DraculaOrange' },
          information = { raw = '[i]', rendered = '󰙎 ', highlight = 'DraculaPink' },
          savings = { raw = '[s]', rendered = ' ', highlight = 'DraculaGreen' },
          idea = { raw = '[I]', rendered = '󰛨 ', highlight = 'DraculaYellow' },
          pros = { raw = '[p]', rendered = ' ', highlight = 'DraculaGreen' },
          cons = { raw = '[c]', rendered = ' ', highlight = 'DraculaOrange' },
          fire = { raw = '[f]', rendered = '󰈸 ', highlight = 'DraculaRed' },
          key = { raw = '[k]', rendered = ' ', highlight = 'DraculaYellow' },
          win = { raw = '[w]', rendered = ' ', highlight = 'DraculaPurple' },
          up = { raw = '[u]', rendered = '󰔵 ', highlight = 'DraculaGreen' },
          down = { raw = '[d]', rendered = '󰔳 ', highlight = 'DraculaRed' },
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

return {
  --- syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = function()
      require('nvim-treesitter').install({
        'bash',
        'css',
        'dockerfile',
        'elixir',
        'html',
        'javascript',
        'json',
        'jsx',
        'liquid',
        'lua',
        'markdown',
        'python',
        'query',
        'regex',
        'tsx',
        'typescript',
        'vim',
        'yaml',
      })
      require('nvim-treesitter').update()
    end,
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  --- colorscheme
  {
    'dracula/vim',
    name = 'dracula',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[
        colorscheme dracula
        highlight Normal ctermbg=NONE
        highlight NonText ctermbg=NONE guifg='#ABB2BF' gui=italic
        highlight Comment ctermbg=NONE guifg='#6272A4' gui=italic
        highlight Difftext ctermbg=NONE guibg=NONE
      ]])
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
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      -- tabline = {
      --   lualine_a = { 'buffers' },
      -- },
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
          return " " .. icon .. count
        end,
        numbers = 'ordinal',
      },
    },
  },

  -- {
  --   'https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git',
  --   config = function()
  --     require('rainbow-delimiters.setup').setup {
  --       highlight = {
  --         "DraculaRed",
  --         "DraculaYellow",
  --         "DraculaBlue",
  --         "DraculaOrange",
  --         "DraculaGreen",
  --         "DraculaPurple",
  --         "DraculaCyan",
  --       },
  --     }
  --   end
  -- },

  --- indentation guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      indent = { highlight = 'DraculaSubtle' },
      scope = { highlight = 'DraculaOrange' }
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
        dashboard.button('o', '󰂺  > Open session for cwd', function() require("persistence").load() end),
        dashboard.button('b', '󰂻  > Browse sessions', function() require("persistence").select() end),
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

  --- markdown
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      completions = {
        lsp = { enabled = true },
      },
    },
  },
}

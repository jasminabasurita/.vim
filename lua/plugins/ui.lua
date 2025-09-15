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
    config = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'bash',
          'css',
          'dockerfile',
          'elixir',
          'html',
          'javascript',
          'json',
          'javascriptreact',
          'liquid',
          'lua',
          'markdown',
          'python',
          'query',
          'regex',
          'typescriptreact',
          'typescript',
          'vim',
          'yaml',
        },
        callback = function()
          -- syntax highlighting, provided by Neovim
          vim.treesitter.start()
          -- folds, provided by Neovim
          vim.wo.foldlevel = 9999999                          --default to all folds open
          vim.wo.foldmethod = 'expr'                          --use a function to fold
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()' --set treesitter as fold function
          -- indentation, provided by nvim-treesitter
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end

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
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'AndreM222/copilot-lualine',
    },
    opts = {
      sections = {
        lualine_x = { { 'copilot', show_colors = true }, 'encoding', 'fileformat', 'filetype' },
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
          return " " .. icon .. count
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

  --- markdown
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { "markdown", "codecompanion" },
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

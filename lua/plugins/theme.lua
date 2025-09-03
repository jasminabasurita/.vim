return {
  --- syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
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
      },
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
        highlight NonText ctermbg=NONE guifg='#6272A4'
        highlight Difftext ctermbg=NONE guibg=NONE
      ]])
    end,
  },

  ---highlight color definitions (#844631)
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { -- set to setup table
    },
  },

  --- statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      tabline = {
        lualine_a = {'buffers'},
      },
    },
  },

  --- indentation guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ---@module 'ibl'
    ---@type ibl.config
    opts = {},
  },

  --- greeter
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')

      dashboard.section.header.val = require('assets.rat')
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
  }
}

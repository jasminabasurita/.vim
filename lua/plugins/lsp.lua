return {
  {
    'williamboman/mason.nvim',

    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },

    config = function()
      require('mason').setup()

      require('mason-lspconfig').setup({
        automatic_enable = true,
        automatic_installation = true,

        ensure_installed = {
          'bashls',
          'cssls',
          'cssmodules_ls',
          'dockerls',
          -- 'elixirls',
          'eslint',
          'html',
          'jsonls',
          'just',
          'lua_ls',
          'ts_ls',
        },
      })

      require('mason-tool-installer').setup({
        ensure_installed = {
          'bash-language-server',
          'prettier',
          'eslint_d',
          'markdownlint',
          'shellcheck',
          'shfmt',
          'stylua',
        },
      })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
    },
    keys = {
      {
        '<leader>d',
        function()
          vim.diagnostic.open_float()
        end,
        { desc = 'Goto previous diagnostic' },
      },
      {
        '[d',
        function()
          vim.diagnostic.jump({ count = -1, float = true })
        end,
        { desc = 'Goto previous diagnostic' },
      },
      {
        ']d',
        function()
          vim.diagnostic.jump({ count = 1, float = true })
        end,
        { desc = 'Goto next diagnostic' },
      },
      {
        '[e',
        function()
          vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity['ERROR'] })
        end,
        { desc = 'Goto previous error' },
      },
      {
        ']e',
        function()
          vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity['ERROR'] })
        end,
        { desc = 'Goto next error' },
      },
      {
        '[w',
        function()
          vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity['WARN'] })
        end,
        { desc = 'Goto previous warning' },
      },
      {
        ']w',
        function()
          vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity['WARN'] })
        end,
        { desc = 'Goto next warning' },
      },
      {
        '<leader>a',
        function()
          vim.lsp.buf.code_action()
        end,
        { desc = 'List code actions' },
      },
      -- {
      --   'gD',
      --   function()
      --     vim.lsp.buf.declaration()
      --   end,
      --   { desc = 'Goto declaration' },
      -- },
      {
        'gi',
        function()
          vim.lsp.buf.implementation()
        end,
        { desc = 'Goto implementation' },
      },
      {
        'go',
        function()
          vim.lsp.buf.type_definition()
        end,
        { desc = 'Goto type definition' },
      },
      {
        'gs',
        function()
          vim.lsp.buf.signature_help()
        end,
        { desc = 'View signature info' },
      },
      {
        'gk',
        function()
          vim.lsp.buf.hover()
        end,
        { desc = 'Show LSP hover definition' },
      },
      {
        '<leader>ih',
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end,
        { desc = 'Rename symbol' },
      },
    },

    config = function()
      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      local capabilities = cmp_nvim_lsp.default_capabilities()

      vim.lsp.config('*', {
        capabilities = capabilities,
      })

      --make diagnostic floats more readable
      vim.diagnostic.config({ float = { border = 'single' } })

      -- Bash
      vim.lsp.config('bashls', {
        filetypes = { 'sh', 'bash', 'zsh' },
      })

      -- TypeScript
      local inlayHints = {
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includePropertyDeclarationTypeHints = true,
        includeInlayEnumMemberValueHints = false, -- default
        includeInlayParameterNameHints = 'none', -- default, can be 'none' | 'literals' | 'all'
        includeInlayParameterNameHintsWhenArgumentMatchesName = false, -- default
        includeInlayVariableTypeHintsWhenTypeMatchesName = false, -- default
      }

      vim.lsp.config('ts_ls', {
        settings = {
          typescript = { inlayHints = inlayHints },
          javascript = { inlayHints = inlayHints },
        },
      })
    end,
  },

  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },

  -- Formatter
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    keys = {
      {
        '<c-f>',
        function()
          require('conform').format({ async = true })
        end,
        { desc = 'Format current buffer' },
      },
    },
    opts = {
      format_on_save = {
        timeout_ms = 1000,
      },
      default_format_opts = {
        lsp_format = 'fallback',
      },
      formatters_by_ft = {
        typescript = { 'prettier', 'eslint_d' },
        typescriptreact = { 'prettier', 'eslint_d' },
        javascript = { 'prettier', 'eslint_d' },
        javascriptreact = { 'prettier', 'eslint_d' },
        css = { 'prettier' },
        scss = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        liquid = { 'prettier' },
        lua = { 'stylua' },
        sh = { 'shfmt', 'prettier' },
        markdown = { 'prettier' },
      },
      formatters = {
        prettier = {
          require_cwd = true, --config working directory. Must have config in project
        },
      },
    },
  },

  --- Configure the LSP for neovim configs
  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
      library = { { path = '${3rd}/luv/library', words = { 'vim%.uv' } } },
    },
  },
}

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
          'dockerls',
          -- 'elixirls',
          'eslint',
          'html',
          'jsonls',
          'lua_ls',
          'ts_ls',
        },
      })

      require('mason-tool-installer').setup({
        ensure_installed = {
          'bash-language-server',
          'eslint_d',
          'prettier',
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
      { '<leader>d', function() vim.diagnostic.open_float() end, { desc = 'Goto previous diagnostic' } },
      { '[d',        function() vim.diagnostic.goto_prev() end,  { desc = 'Goto previous diagnostic' } },
      { ']d',        function() vim.diagnostic.goto_next() end,  { desc = 'Goto next diagnostic' } },
      {
        '[e',
        function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity["ERROR"] }) end,
        { desc = 'Goto previous error' },
      },
      {
        ']e',
        function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity["ERROR"] }) end,
        { desc = 'Goto next error' },
      },
      {
        '[w',
        function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity["WARN"] }) end,
        { desc = 'Goto previous warning' },
      },
      {
        ']w',
        function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity["WARN"] }) end,
        { desc = 'Goto next warning' },
      },
      { '<c-f>',     function() vim.lsp.buf.format() end,          { desc = 'Format current buffer' } },
      { '<leader>a', function() vim.lsp.buf.code_action() end,     { desc = 'List code actions' } },
      { 'gd',        function() vim.lsp.buf.definition() end,      { desc = 'Goto definition' } },
      { 'gD',        function() vim.lsp.buf.declaration() end,     { desc = 'Goto declaration' } },
      { 'gi',        function() vim.lsp.buf.implementation() end,  { desc = 'Goto implementation' } },
      { 'go',        function() vim.lsp.buf.type_definition() end, { desc = 'Goto type definition' } },
      { 'gr',        function() vim.lsp.buf.references() end,      { desc = 'List all references' } },
      { 'gs',        function() vim.lsp.buf.signature_help() end,  { desc = 'View signature info' } },
      { 'gk',        function() vim.lsp.buf.hover() end,           { desc = 'Show LSP hover definition' } },
    },

    config = function()
      local lspconfig = require('lspconfig')
      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      local capabilities = cmp_nvim_lsp.default_capabilities()

      vim.lsp.config('*', {
        capabilities = capabilities,
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end,
      })

      -- Bash
      lspconfig.bashls.setup({})

      -- CSS
      lspconfig.cssls.setup({})

      -- Docker
      lspconfig.dockerls.setup({})

      -- Elixir
      -- lspconfig.elixirls.setup({ capabilities = capabilities })

      -- ESLint
      lspconfig.eslint.setup({})

      -- HTML
      lspconfig.html.setup({})

      -- JSON
      lspconfig.jsonls.setup({})

      -- Lua
      lspconfig.lua_ls.setup({})

      --- prettier
      lspconfig.prettier.setup({})

      -- TypeScript
      local inlayHints = {
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includePropertyDeclarationTypeHints = true,
      }

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        settings = {
          typescript = { inlayHints = inlayHints },
          javascript = { inlayHints = inlayHints },
        },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    event = "VeryLazy",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    opts = {},
  }
}

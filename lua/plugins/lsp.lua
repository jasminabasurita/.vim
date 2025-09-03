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
      { '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', { desc = 'Goto previous diagnostic' } },
      { ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', { desc = 'Goto next diagnostic' } },
      {
        '[e',
        '<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity["ERROR"] })<cr>',
        { desc = 'Goto previous error' },
      },
      {
        ']e',
        '<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity["ERROR"] })<cr>',
        { desc = 'Goto next error' },
      },
      {
        '[w',
        '<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity["WARN"] })<cr>',
        { desc = 'Goto previous warning' },
      },
      {
        ']w',
        '<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity["WARN"] })<cr>',
        { desc = 'Goto next warning' },
      },
      { 'gc', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = 'List code actions' } },
      { 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { desc = 'Goto definition' } },
      { 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { desc = 'Goto declaration' } },
      { 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { desc = 'Goto implementation' } },
      { 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { desc = 'Goto type definition' } },
      { 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', { desc = 'List all references' } },
      { 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { desc = 'View signature info' } },
      { 'gk', '<cmd>lua vim.lsp.buf.hover()<cr>', { desc = 'Show LSP hover definition' } },
    },

    config = function()
      local lspconfig = require('lspconfig')
      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Bash
      lspconfig.bashls.setup({ capabilities = capabilities })

      -- CSS
      lspconfig.cssls.setup({ capabilities = capabilities })

      -- Docker
      lspconfig.dockerls.setup({ capabilities = capabilities })

      -- Elixir
      -- lspconfig.elixirls.setup({ capabilities = capabilities })

      -- ESLint
      lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            command = 'EslintFixAll',
          })
        end,
      })

      -- HTML
      lspconfig.html.setup({ capabilities = capabilities })

      -- JSON
      lspconfig.jsonls.setup({ capabilities = capabilities })

      -- Lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })

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
}

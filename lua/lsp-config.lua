require'lspconfig'.ts_ls.setup{
  filetypes = {
    "typescript",
    "typescriptreact",
  },
}
require'lspconfig'.elixirls.setup{
  cmd = { "/Users/jasminajacquelina/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
}

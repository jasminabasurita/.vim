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
        'just',
        'liquid',
        'lua',
        'markdown',
        'markdown_inline',
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
          'just',
          'liquid',
          'lua',
          'markdown',
          'markdown_inline',
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
          vim.wo.foldlevel = 9999999 --default to all folds open
          vim.wo.foldmethod = 'expr' --use a function to fold
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()' --set treesitter as fold function
          -- indentation, provided by nvim-treesitter
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}

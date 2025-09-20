return {
  --- adds keymaps to surround text in matching pairs
  {
    'kylechui/nvim-surround',
    version = '^3.0.0', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    opts = {},
  },
  --- Automatically add closing pairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      local autopairs = require('nvim-autopairs')
      local Rule = require('nvim-autopairs.rule')
      local cond = require('nvim-autopairs.conds')

      autopairs.setup({ check_ts = true })

      local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
      autopairs.add_rules({

        -- Rule for a pair with left-side ' ' and right side ' '
        Rule(' ', ' ')
        -- Pair will only occur if the conditional function returns true
            :with_pair(function(opts)
              -- We are checking if we are inserting a space in (), [], or {}
              local pair = opts.line:sub(opts.col - 1, opts.col)
              return vim.tbl_contains({
                brackets[1][1] .. brackets[1][2],
                brackets[2][1] .. brackets[2][2],
                brackets[3][1] .. brackets[3][2],
              }, pair)
            end)
            :with_move(cond.none())
            :with_cr(cond.none())
        -- We only want to delete the pair of spaces when the cursor is as such: ( | )
            :with_del(
              function(opts)
                local col = vim.api.nvim_win_get_cursor(0)[2]
                local context = opts.line:sub(col - 1, col + 2)
                return vim.tbl_contains({
                  brackets[1][1] .. '  ' .. brackets[1][2],
                  brackets[2][1] .. '  ' .. brackets[2][2],
                  brackets[3][1] .. '  ' .. brackets[3][2],
                }, context)
              end
            ),
      })
      -- For each pair of brackets we will add another rule
      for _, bracket in pairs(brackets) do
        autopairs.add_rules({
          -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
          Rule(bracket[1] .. ' ', ' ' .. bracket[2])
              :with_pair(cond.none())
              :with_move(function(opts)
                return opts.char == bracket[2]
              end)
              :with_del(cond.none())
              :use_key(bracket[2])
          -- Removes the trailing whitespace that can occur without this
              :replace_map_cr(function(_)
                return '<C-c>2xi<CR><C-c>O'
              end),
        })
      end
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    lazy = false,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      opts = {
        -- Defaults
        enable_close = true,           -- Auto close tags
        enable_rename = true,          -- Auto rename pairs of tags
        enable_close_on_slash = false, -- Auto close on trailing </
      },
    },
  },
  --- Delete buffers without breaking layouts
  {
    'famiu/bufdelete.nvim',
    keys = {
      { '<leader>q', '<cmd>:Bdelete<cr>', { desc = 'Delete current buffer' } },
    },
  },
  -- some utils to help with refactoring.
  {
    'nvim-treesitter/nvim-treesitter-refactor',
    enabled = false, -- Not currently supporting `main` branch of treesitter
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      refactor = {
        smart_rename = {
          enable = true,
          -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
          keymaps = {
            smart_rename = 'grr',
          },
        },
      },
    },
  },
}

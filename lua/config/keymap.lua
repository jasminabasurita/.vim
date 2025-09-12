local merge = require('helpers').merge

local defaults = { silent = true, noremap = true }

local map = function(mode, lhs, rhs, opt)
  vim.keymap.set(mode, lhs, rhs, merge(defaults, opt))
end

local nmap = function(lhs, rhs, opt) map('n', lhs, rhs, opt) end
local imap = function(lhs, rhs, opt) map('i', lhs, rhs, opt) end
local vmap = function(lhs, rhs, opt) map('v', lhs, rhs, opt) end

vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"

-- Exit insert mode
map({ 'i', 't' }, 'jk', '<esc>', { desc = 'exit insert mode' })

-- Clear highlights
nmap('<leader>w', ':noh<cr>', { desc = 'Clear highlights' })

-- capitalize a word in insert or normal mode
nmap('<C-u>', 'viwUe', { desc = 'Capitalize word' })
imap('<C-u>', '<esc>viwUea', { desc = 'Capitalize word' })

-- Easier split navigation
nmap('<C-J>', '<C-W><C-J>', { desc = 'Move to split down' })
nmap('<C-K>', '<C-W><C-K>', { desc = 'Move to split up' })
nmap('<C-L>', '<C-W><C-L>', { desc = 'Move to split right' })
nmap('<C-H>', '<C-W><C-H>', { desc = 'Move to split left' })

-- Faster Navigation
map({ 'n', 'v', 'o' }, 'H', '^', { desc = 'Move to start of line' })
map({ 'n', 'v', 'o' }, 'L', '$', { desc = 'Move to end of line' })
map({ 'n', 'v', 'o' }, 'J', '4j', { desc = 'Move 4 lines down' })
map({ 'n', 'v', 'o' }, 'K', '4k', { desc = 'Move 4 lines up' })

-- Buffers
nmap('<Leader>h', ':BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
nmap('<Leader>l', ':BufferLineCycleNext<CR>', { desc = 'Next buffer' })
nmap('<Leader>H', ':BufferLineMovePrev<CR>', { desc = 'Previous buffer' })
nmap('<Leader>L', ':BufferLineMoveNext<CR>', { desc = 'Next buffer' })
nmap('<leader>1', function() require('bufferline').go_to(1, true) end, { desc = 'Go to buffer 1' })
nmap('<leader>2', function() require('bufferline').go_to(2, true) end, { desc = 'Go to buffer 2' })
nmap('<leader>3', function() require('bufferline').go_to(3, true) end, { desc = 'Go to buffer 3' })
nmap('<leader>4', function() require('bufferline').go_to(4, true) end, { desc = 'Go to buffer 4' })
nmap('<leader>5', function() require('bufferline').go_to(5, true) end, { desc = 'Go to buffer 5' })
nmap('<leader>6', function() require('bufferline').go_to(6, true) end, { desc = 'Go to buffer 6' })
nmap('<leader>7', function() require('bufferline').go_to(7, true) end, { desc = 'Go to buffer 7' })
nmap('<leader>8', function() require('bufferline').go_to(8, true) end, { desc = 'Go to buffer 8' })
nmap('<leader>9', function() require('bufferline').go_to(9, true) end, { desc = 'Go to buffer 9' })

-- Add Punctuation to end of line or line break
nmap('<leader>;', '$a;<Esc>')
nmap(
  '<leader>,',
  function()
    vim.cmd.normal '$a,'
  end
)

-- Break line at cursor
nmap('<leader><CR>', 'i<CR><Esc>')

-- Flatten
map({ 'n', 'v' }, '<leader>f', 'J')

-- Break by space
vmap('<leader>b', [[:s/\s/\r/g<CR>:noh<CR>]])

-- Add Symbol after Cursor
nmap('<leader>}', 'a}<Esc>')
nmap('<leader>)', 'a)<Esc>')
nmap('<leader>]', 'a]<Esc>')
nmap('<leader>"', 'a"<Esc>')
nmap([[<leader>']], [[a'<Esc>]])

-- Spaces in brackets
nmap('<leader>{', 'vi{<Esc>`>a <Esc>`<i <Esc>')
nmap('<leader>[', 'vi[<Esc>`>a <Esc>`<i <Esc>')
nmap('<leader>(', 'vi(<Esc>`>a <Esc>`<i <Esc>')

-- Surround Selection in /* */
vmap('<leader>/', '<Esc>`>a*/<Esc>`<i/*<Esc>')
-- React comment
vmap('<leader>rc', '<Esc>`>a*/}<Esc>`<i{/*<Esc>')

nmap('<leader>ts', [[:%s/\s\+$//e<cr>]], { desc = 'Clean up trailing spaces' })

nmap('<leader>cf', '<cmd>let @+ = @%<cr>', { desc = 'Copy current filename to system clipboard' })

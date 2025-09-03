local map = vim.keymap.set
local nmap = function(lhs, rhs, opt) map('n', lhs, rhs, opt) end
local imap = function(lhs, rhs, opt) map('i', lhs, rhs, opt) end
local vmap = function(lhs, rhs, opt) map('v', lhs, rhs, opt) end

vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"

-- Exit insert mode
map({ 'i', 't' }, 'jk', '<esc>', { desc = 'exit insert mode' })

-- Clear highlights
nmap('<leader>w', ':noh<cr>', { silent = true, desc = 'Clear highlights' })

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
-- nmap('<Leader>q', ':Bdelete<CR>')
nmap('<Leader>h', ':bp<CR>')
nmap('<Leader>l', ':bn<CR>')
nmap('<Leader>1', ':b1<CR>')
nmap('<Leader>2', ':b2<CR>')
nmap('<Leader>3', ':b3<CR>')
nmap('<Leader>4', ':b4<CR>')
nmap('<Leader>5', ':b5<CR>')
nmap('<Leader>6', ':b6<CR>')
nmap('<Leader>7', ':b7<CR>')
nmap('<Leader>8', ':b8<CR>')
nmap('<Leader>9', ':b9<CR>')

-- Add Punctuation to end of line or line break
nmap('<leader>;', '$a;<Esc>')
nmap('<leader>,', '$a,<Esc>')

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

-- Open vim configs
nmap('<leader>ev', ':edit ~/.vim/ <cr>')

nmap('<leader>ts', [[:%s/\s\+$//e<cr>]], { silent = true, desc = 'Clean up trailing spaces'})

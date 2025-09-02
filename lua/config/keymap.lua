local map = vim.keymap.set
local nmap = function(lhs, rhs, opt) map('n', lhs, rhs, opt) end 
local imap = function(lhs, rhs, opt) map('i', lhs, rhs, opt) end 
local vmap = function(lhs, rhs, opt) map('v', lhs, rhs, opt) end 

vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"

-- Exit insert mode
map({ 'i', 't' }, 'jk', '<esc>')

-- Clear highlights
nmap('<F2>', ':noh<cr>', { silent = true })

-- capitalize a word in insert or normal mode
nmap('<C-u>', 'viwUe')
imap('<C-u>', '<esc>viwUea')

-- open file explorer
nmap('<F1>', ':e.<CR>')

-- Easier split navigation
nmap('<C-J>', '<C-W><C-J>')
nmap('<C-K>', '<C-W><C-K>')
nmap('<C-L>', '<C-W><C-L>')
nmap('<C-H>', '<C-W><C-H>')

-- Faster Navigation
map({ 'n', 'v', 'o' }, 'H', '^')
map({ 'n', 'v', 'o' }, 'L', '$')
map({ 'n', 'v', 'o' }, 'J', '4j')
map({ 'n', 'v', 'o' }, 'K', '4k')

-- Buffers
nmap('<Leader>q', ':Bdelete<CR>')
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

-- Moving through grep
nmap('<leader>n', ':cn<CR>')
nmap('<leader>p', ':cp<CR>')

-- LSP keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(e)
    local opts = { buffer = e.buf }
    -- show lsp definition hover
    nmap('<leader>k', function() vim.lsp.buf.hover() end, opts)
  end
})

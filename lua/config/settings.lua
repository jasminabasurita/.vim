-- General settings
vim.o.signcolumn = 'yes' -- Always show the sign column
vim.o.laststatus = 3 -- Always show a status line
vim.o.showmode = false -- Don't show mode since we have a status line
vim.o.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus' -- set system clipboard as the default register
vim.o.diffopt = 'vertical,' .. vim.o.diffopt -- use vertical diffs
vim.o.winborder = 'single' -- default window border style
vim.o.number = true -- Show line numbers
vim.o.colorcolumn = '80' -- add guide for long lines
vim.o.cursorline = true -- highlight current line
vim.o.scrolloff = 15 -- Start scrolling when we're 8 lines away from margins

-- Spaces > tabs
vim.o.tabstop = 2 -- show existing tab with 2 spaces width
vim.o.shiftwidth = 2 -- when indenting with '>', use 2 spaces width
vim.o.shiftround = true -- Round to the nearest tab
vim.o.expandtab = true -- On pressing tab, insert 2 spaces

-- Indentation
vim.o.autoindent = true -- Enable auto-indent
vim.o.smartindent = true -- C-like autoindenting when starting a new line

-- Mouse
vim.o.mouse = 'a' -- Enable mouse
vim.o.mousemoveevent = true -- Enable mouse

-- Line wrapping
vim.o.wrap = true
-- vim.o.wrapmargin = 15
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.sidescrolloff = 15 -- In case I turn off line wrapping

-- Searching & replacing
vim.o.incsearch = true -- Show pattern matches as search is typed
vim.o.hlsearch = true -- Highlight previous search pattern
vim.o.ignorecase = true -- Ignore case in search pattern
vim.o.smartcase = true -- ^ But be smart about it
vim.o.inccommand = 'nosplit' -- highlight substitutions

-- More natural splits
vim.o.splitbelow = true
vim.o.splitright = true

-- Blinking cursor
vim.o.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,'
  .. 'a:blinkwait700-blinkoff400-blinkon250-lCursor,'
  .. 'sm:block-blinkwait175-blinkoff150-blinkon175'

-- folds
vim.o.foldtext = ''
vim.opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = '╌',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',

  -- heavy borders between splits
  horiz = '━',
  horizup = '┻',
  horizdown = '┳',
  vert = '┃',
  vertleft = '┫',
  vertright = '┣',
  verthoriz = '╋',
}

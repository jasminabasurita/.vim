" Built in Vim Settings

" filetype func
filetype off
filetype plugin indent on

set nocompatible  " no vi compat
set colorcolumn=80  " add guide for long lines
set cursorline    " highlight current line
set hidden        " allow for modified buffers to be in the background, makes buffers feel more like tabs
set tabstop=2     " show existing tab with 2 spaces width
set shiftwidth=2  " when indenting with '>', use 2 spaces width
set shiftround    " Round to the nearest tab
set expandtab     " On pressing tab, insert 2 spaces
set autoindent    " Enable auto-indent
set smarttab      " Tab smarter
set number        " Show line numbers
set smartindent   " C-like autoindenting when starting a new line
set mouse=a       " Enable mouse
set noswapfile    " Disables making temporary backup files (.swp)
set scrolloff=15  " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1  " Auto resize Vim splits to active split
set backspace=indent,eol,start  " Make backspace key work as expected
set incsearch     " Show pattern matches as search is typed
set laststatus=2     " Always show a status line
set encoding=utf-8   " Use Utf-8
scriptencoding utf-8
set hlsearch        " Highlight previous search pattern
set ignorecase      " Ignore case in search pattern
set smartcase       " ^ But be smart about it
set noshowmode
set clipboard+=unnamedplus " set system clipboard as the default register
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
set diffopt=vertical,filler
set inccommand=nosplit " highlight substitutions
set nofixendofline " no new line on save
" more natural splits
set splitbelow
set splitright

" Save and Reload Folds!
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview

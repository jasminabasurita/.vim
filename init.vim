" ~/.vimrc

" no vi compat
set nocompatible

" filetype func
filetype off
filetype plugin indent on

" leader = spacebar
let g:mapleader = ' '

" I like to use the ~/.vim directory instead of the ~/.config/nvim directory
set runtimepath+=~/.vim

" Plug
call plug#begin('~/.vim/plugged')
" start- all plugins below

Plug 'scrooloose/nerdtree'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'moll/vim-bbye'

if has('python3')
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-cssomni'
  Plug 'kburdett/vim-nuuid'

  autocmd BufEnter * call ncm2#enable_for_buffer()
  set completeopt=noinsert,menuone,noselect
  set shortmess+=c
  inoremap <expr> <CR> (pumvisible() ? "\<C-y>" : "\<CR>")
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
endif

Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMultilineClose = 0 " disable line jumping for closing pair
let g:AutoPairsMapCR = 1

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
" Plug 'jasminabasurita/NeoDim', {'frozen': 1}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sheerun/vim-polyglot'
Plug 'farfanoide/vim-kivy'
Plug 'romainl/vim-qf'
Plug 'yssl/QFEnter'
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']
Plug 'mhinz/vim-grepper'
nmap gs <plug>(GrepperOperator)
vmap gs <plug>(GrepperOperator)
nnoremap <leader>ag :Grepper -tool ag<cr>
nnoremap <leader>rg :Grepper -tool rg<cr>

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|bower_components|node_modules',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
\ }
Plug 'w0rp/ale'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'elzr/vim-json'
Plug 'othree/jspc.vim'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ap/vim-css-color'
" Build Composer function for markdown composer
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

" stop - all plugins above
call plug#end()

" font
set guifont=FiraCode\ Nerd\ Font\ 11
" set guifont=Fira_Code:h15

" set color
set termguicolors
colorscheme dracula
let g:dracula_italic = 1
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight Difftext ctermbg=NONE guibg=NONE

" vim-markdown-composer
let g:markdown_composer_syntax_theme='dracula'
let g:markdown_composer_autostart=0
nnoremap <leader>mc :ComposerStart<CR>

" Indentation Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#15181F ctermbg=15
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#1E2029 ctermbg=NONE

" AIRLINE CONFIG
let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#ale#enabled=1

" " Save and Reload Folds!
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview

" NERDTREE
" NERDTree shortcut
nnoremap <F1> :e.<CR>
" Show dot files (ie. .vimrc)
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree Syntax Highlighting
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeLimitedSyntax=1

" Built in Vim Settings
set colorcolumn=80    " add guide for long lines
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

" ALE CONIGURATIONS
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'javascript.jsx': ['eslint'],
\   'python': ['flake8'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\   'vim': ['vint']
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['autopep8', 'yapf'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\   'json': ['prettier'],
\   'markdown': ['prettier']
\}

" with prettier
" \   'javascript': ['prettier', eslint'],
" \   'css': ['prettier', 'stylelint'],
" \   'scss': ['prettier', 'stylelint'],
" \   'json': ['prettier'],

let g:ale_javascript_prettier_use_local_config = 1

let g:ale_sign_column_always = 1
let g:ale_sign_warning = '>>'
" Comment these 2 lines out if your terminal doesn't support emojis
" let g:ale_sign_warning = '⚠️'
" let g:ale_sign_error = '⛔️'
highlight ALEError ctermbg=none guibg=none cterm=underline gui=underline
highlight ALEWarning ctermbg=none guibg=none cterm=underline gui=underline
" highlight ALEErrorSign guibg='#810000'
" highlight ALEErrorSign guibg='#823838'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight ALEErrorSign guibg='#5F0000' gui=underline
highlight ALEWarningSign guifg='#F1FA8C'
let g:ale_fix_on_save = 0
noremap <C-F>  :ALEFix <CR>

" My Key Mappings
" clears vims search highlight with F2
nnoremap  <silent> <F2> :noh<cr>
noh
" Exit insert mode with ease
inoremap jk <Esc>
" In the terminal too!
tnoremap jk <C-\><C-N>
" capitalize a word in insert or normal mode
inoremap <C-u> <Esc>viwUea
nnoremap <C-u> viwUe
" Easier Split Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" more natural splits
set splitbelow
set splitright
" Delete Buffer without closing window
nnoremap <Leader>q :Bdelete<CR>
" Easier Buffer Switching
nnoremap <Leader>h :bp<CR>
nnoremap <Leader>l :bn<CR>
nnoremap <Leader>1 :b1<CR>
nnoremap <Leader>2 :b2<CR>
nnoremap <Leader>3 :b3<CR>
nnoremap <Leader>4 :b4<CR>
nnoremap <Leader>5 :b5<CR>
nnoremap <Leader>6 :b6<CR>
nnoremap <Leader>7 :b7<CR>
nnoremap <Leader>8 :b8<CR>
nnoremap <Leader>9 :b9<CR>
" Faster Navigation
nnoremap H ^
nnoremap L $
nnoremap J 4j
nnoremap K 4k
vnoremap H ^
vnoremap L $
vnoremap J 4j
vnoremap K 4k
onoremap H ^
onoremap L $
onoremap J 4j
onoremap K 4k
" Add Punctuation to end of line or line break
nnoremap <leader><CR> i<CR><Esc>
" Flatten
nnoremap <leader>f J
vnoremap <leader>f J
" Break by space
vnoremap <leader>b :s/\s/\r/g<CR>:noh<CR>

nnoremap <leader>; $a;<Esc>
nnoremap <leader>, $a,<Esc>
" Add Symbol after Cursor
nnoremap <leader>} a}<Esc>
nnoremap <leader>) a)<Esc>
nnoremap <leader>] a]<Esc>
nnoremap <leader>" a"<Esc>
nnoremap <leader>' a'<Esc>
"spaces in brackets
nnoremap <leader>{ vi{<Esc>`>a <Esc>`<i <Esc>
nnoremap <leader>[ vi[<Esc>`>a <Esc>`<i <Esc>
nnoremap <leader>( vi(<Esc>`>a <Esc>`<i <Esc>
vnoremap <leader>[ <Esc>`>a <Esc>`<i <Esc>
" Surround Selection in /* */
vnoremap <leader>/ <Esc>`>a*/<Esc>`<i/*<Esc>
" React comment
vnoremap <leader>rc <Esc>`>a*/}<Esc>`<i{/*<Esc>
" Make it easier to open and edit vim whenever!
nnoremap <leader>ev :edit ~/.vim/init.vim <cr>
" And resource the vimrc with ease!
nnoremap <leader>sv :source $MYVIMRC<cr>
" Moving through grep
nnoremap <leader>n :cn<CR>
nnoremap <leader>p :cp<CR>

" My Abbreviations
iabbrev @@ jasminajacquelina@gmail.com
iabbrev ireact import React from 'react'
iabbrev ireactrouter import {  } from 'react-router-dom'
iabbrev iaxios import axios from 'axios'
iabbrev rrouter const router = require('express').Router()
iabbrev tapx x => (console.log(x), x),

" Get Rid of Git Gutters key mappings
let g:gitgutter_map_keys = 0

" my javascript libraries
let g:used_javascript_libs = 'angularjs,react,jquery,underscore,angularuirouter,flux,requirejs,jasmine,chai,d3'

" vim-jsx - allow syntax highlighting in .js files
let g:jsx_ext_required = 0

" Save Files With Root Priveleges
command! -nargs=0 Sw w !sudo tee % > /dev/null

command! -bar NoCRLF :set ff=unix

command! -bar TrailX :%s/\s\+$//e
nnoremap  <silent> <F3> :TrailX<cr>

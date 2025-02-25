" ~/.vimrc

" leader = spacebar
let g:mapleader = ' '

if has('python3')
  " autocmd BufEnter * call ncm2#enable_for_buffer()
  " set completeopt=noinsert,menuone,noselect
  " set shortmess+=c
  " inoremap <expr> <CR> (pumvisible() ? "\<C-y>" : "\<CR>")
  " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
endif

let g:AutoPairsMultilineClose = 0 " disable line jumping for closing pair
let g:AutoPairsMapCR = 1

let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']
nmap gs <plug>(GrepperOperator)
vmap gs <plug>(GrepperOperator)
nnoremap <leader>ag :Grepper -tool ag<cr>
nnoremap <leader>rg :Grepper -tool rg<cr>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|bower_components|node_modules|dist',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
\ }

" Build Composer function for markdown composer
"function! BuildComposer(info)
"  if a:info.status != 'unchanged' || a:info.force
"    if has('nvim')
"      !cargo build --release
"    else
"      !cargo build --release --no-default-features --features json-rpc
"    endif
"  endif
"endfunction
"Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

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


" ALE CONIGURATIONS
" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \   'typescript': ['eslint'],
" \   'typescript.tsx': ['eslint'],
" \   'javascript.jsx': ['eslint'],
" \   'python': ['flake8'],
" \   'css': ['stylelint'],
" \   'scss': ['stylelint'],
" \   'vim': ['vint']
" \}
" let g:ale_fixers = {
" \   'javascript': ['eslint'],
" \   'typescript': ['prettier', 'eslint'],
" \   'typescriptreact': ['prettier', 'eslint'],
" \   'javascript.jsx': ['eslint'],
" \   'python': ['autopep8', 'yapf'],
" \   'css': ['stylelint'],
" \   'scss': ['stylelint'],
" \   'json': ['prettier'],
" \   'markdown': ['prettier']
" \}

" with prettier
" \   'javascript': ['prettier', eslint'],
" \   'css': ['prettier', 'stylelint'],
" \   'scss': ['prettier', 'stylelint'],
" \   'json': ['prettier'],

" let g:ale_javascript_prettier_use_local_config = 1

" let g:ale_sign_column_always = 1
" let g:ale_sign_warning = '>>'
" Comment these 2 lines out if your terminal doesn't support emojis
" let g:ale_sign_warning = '⚠️'
" let g:ale_sign_error = '⛔️'
" highlight ALEError ctermbg=none guibg=none cterm=underline gui=underline
" highlight ALEWarning ctermbg=none guibg=none cterm=underline gui=underline
" highlight ALEErrorSign guibg='#810000'
" highlight ALEErrorSign guibg='#823838'
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" highlight ALEErrorSign guibg='#5F0000' gui=underline
" highlight ALEWarningSign guifg='#F1FA8C'
" let g:ale_fix_on_save = 0
" noremap <C-F>  :ALEFix <CR>

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
let g:used_javascript_libs = 'react,jquery,underscore,flux,requirejs,jasmine,chai,d3'

" vim-jsx - allow syntax highlighting in .js files
let g:jsx_ext_required = 0

" Save Files With Root Priveleges
command! -nargs=0 Sw w !sudo tee % > /dev/null

command! -bar NoCRLF :set ff=unix

command! -bar TrailX :%s/\s\+$//e
nnoremap  <silent> <F3> :TrailX<cr>

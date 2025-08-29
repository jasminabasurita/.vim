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

" Get Rid of Git Gutters key mappings
let g:gitgutter_map_keys = 0

" vim-jsx - allow syntax highlighting in .js files
let g:jsx_ext_required = 0

" Save Files With Root Priveleges
command! -nargs=0 Sw w !sudo tee % > /dev/null

command! -bar NoCRLF :set ff=unix

command! -bar TrailX :%s/\s\+$//e
nnoremap  <silent> <F3> :TrailX<cr>

"========.
" NEOVIM | github.com/stove-panini
"--------+----------------.
" ~/.config/nvim/init.vim |
"-------------------------'

"=========.
" General |
"---------'
" use ; to bring up command menu
noremap ; :

" remember undo history
set undofile

" use X11 CLIPBOARD for all yank, delete, change, put operations
set clipboard=unnamedplus

" return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


"===========.
" Interface |
"-----------'
" no line wrap
set nowrap

" show line number sidebar
set number

" highlight current line
set cursorline

" highlight matching [{()}]
set showmatch

" syntax highlighting / indentation style based on filetype
syntax enable
filetype plugin on
filetype indent on

" colorscheme
let base16colorspace=256
colorscheme base16-tomorrow
set background=dark


"============.
" Formatting |
"------------'
" each indentation level is 4 spaces. tabs are not used
set expandtab

" tab key
set tabstop=4

" indent operation (<< and >>)
set shiftwidth=4


"===========.
" Searching |
"-----------'
" ignore case unless a capital is typed
set ignorecase
set smartcase

" enter key clears highlighted search results 
nnoremap <silent> <CR> :nohlsearch<CR><CR>


"======.
" Tabs |
"------'
" keybinds like web browser
nnoremap <C-n>     :tabnew<CR>
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
inoremap <C-n>     <Esc>:tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <A-0> 10gt


"==========.
" Vim-Plug |
"----------'
call plug#begin()

" use single quotes
Plug 'itchyny/lightline.vim'

call plug#end()


" Lightline
"-----------
" hide the default mode list
set noshowmode

" set colorscheme
let g:lightline = {
    \ 'colorscheme':  'Tomorrow_Night',
    \ }

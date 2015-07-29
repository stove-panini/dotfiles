"========.
" .VIMRC |  github.com/stove-panini
"--------+--------------------------.
" it doesn't have to be complicated |
"-----------------------------------'

"=========.
" General |
"---------'
" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo

" respect those special vim modelines at the EOF
set modelines=1

" re-read a file when it's changed externally
set autoread

" redraw only when needed
set lazyredraw

" make backspace behave in a modern sense
set backspace=indent,eol,start

" return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" remember info about open buffers on close
set viminfo^=%

" use the system clipboard if using gvim
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif


"===========.
" Interface |
"-----------'
" line numbers
set number 

" highlight current line
set cursorline

" highlight matching [{()}]
set showmatch

" no line wrap
set nowrap

" autocompleting command menu
set wildmenu
set wildmode=longest,list,full
set wildignorecase

" use ; to bring up command menu (i'm lazy!)
noremap ; :

" syntax highlighting
syntax enable

" highlight based on filetype
filetype plugin on
filetype indent on

" colorscheme
" uncomment next line if term colorscheme is different than vim colorscheme
let g:base16_shell_path="~/.vim/colors/base16-shell/"
let base16colorspace=256
colorscheme base16-tomorrow
set background=dark


"============.
" Formatting |
"------------'
" spaces, not tabs
set expandtab

" 1 tab = 4 spaces
set tabstop=4
set shiftwidth=4

" don't auto-indent pasted text
set paste


"===========.
" Searching |
"-----------'
set incsearch   " incremental
set hlsearch    " highlight results
set ignorecase  " ignore case...
set smartcase   " ...unless a capital is typed

" enter clears highlighted search results
nnoremap <silent> <CR> :nohlsearch<CR><CR> 


"===========.
" Tab Pages |
"-----------'
" keybinds like web browser
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

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

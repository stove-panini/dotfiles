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
"let g:base16_shell_path=".vim/colors/base16-shell/" <-- necessary if using different shell colors
let base16colorspace=256
colorscheme base16-tomorrow
set background=dark


"===========.
" Searching |
"-----------'
set incsearch   " incremental
set hlsearch    " highlight results
set ignorecase  " ignore case...
set smartcase   " ...unless a capital is typed

" enter clears highlighted search results
nnoremap <silent> <CR> :nohlsearch<CR><CR> 


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

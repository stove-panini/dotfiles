"
" ~/.vimrc
"

"""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" sensible defaults
Plug 'tpope/vim-sensible'
" plugin-aware action repeater with '.'
Plug 'tpope/vim-repeat'

" Interface
" ---------
" Smyck colorscheme
Plug 'stove-panini/smyck-color-scheme'
" lightline statusbar
Plug 'itchyny/lightline.vim'
" git branch plugin for lightline
Plug 'itchyny/vim-gitbranch'
" lightline native colorscheme
Plug 'stove-panini/lightline-colorscheme-native'
" writing-mode for text and markdown
Plug 'reedes/vim-pencil'

" Text manipulation
" -----------------
" add/change/remove brackets etc
Plug 'tpope/vim-surround'

" Code-related
" ------------
" Filesystem tree sidebar
Plug 'scrooloose/nerdtree'
" Syntax checker
Plug 'vim-syntastic/syntastic'
" Git diff stats
Plug 'airblade/vim-gitgutter'
" Code autocompletion
" TBD

call plug#end()


"""""""""""""""""""""""""""""
" PLUGIN CONFIG
"""""""""""""""""""""""""""""
" Lightline w/ plugin integration
" -------------------------------
let g:lightline = {
\   'colorscheme': 'native',
\   'active': {
\     'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
\             [ 'syntastic' ] ]
\   },
\   'component_function': {
\     'gitbranch': 'gitbranch#name',
\     'syntastic': 'SyntasticStatuslineFlag'
\   },
\}

" Syntastic
" ---------
"let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Pencil
" ------
let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END


"""""""""""""""""""""""""""""
" OPTIONS
"""""""""""""""""""""""""""""
colorscheme smyck

" Interface
" ---------
" hide default modeline
set noshowmode
" show line numbers
set number
" highlight current line
set cursorline
" no line wrap
set nowrap

" Indentation
" -----------
" each indentation level is 4 spaces. tabs are not used
set tabstop=4
set expandtab
" indent operation (<< and >>) size
set shiftwidth=4

" Search
" ------
" ignore case unless a capital is typed
set ignorecase
set smartcase


"""""""""""""""""""""""""""""
" CUSTOM KEYBINDS
"""""""""""""""""""""""""""""
" map to nothing bc SPACE has a default action (move right)
nnoremap <SPACE> <Nop>
" gotta escape that special character notation
let mapleader = "\<SPACE>"

" split control
nnoremap <leader>- :split<CR>
nnoremap <leader>\ :vsplit<CR>

" tab control
nnoremap <leader>c :tabnew<CR>
nnoremap <leader>n :tabnext<CR>
nnoremap <leader>N :tabprev<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 10gt

" toggles should use ctrl
nnoremap <leader><C-t> :NERDTreeToggle<CR>
nnoremap <leader><C-p> :PencilToggle<CR>

" enter clears search results
nnoremap<leader><CR> :nohlsearch<CR>


"""""""""""""""""""""""""""""
" MISCELLANEOUS
"""""""""""""""""""""""""""""
" use xclipboard if feature is available
if has('clipboard')
    set clipboard=unnamedplus
endif

" enable mouse because I'm a fraud
set mouse=a

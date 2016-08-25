"========.
" NEOVIM | github.com/stove-panini
"--------+----------------.
" ~/.config/nvim/init.vim |
"-------------------------'

"==========.
" Vim-Plug |
"----------'
call plug#begin()

" use single quotes!

" status line
Plug 'itchyny/lightline.vim'

" git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" solarized color scheme
Plug 'altercation/vim-colors-solarized'

" tmux.conf syntax highlight
Plug 'tmux-plugins/vim-tmux'

" easily generate a tmux statusline
Plug 'edkolev/tmuxline.vim'

" automatic session saver, used with tmux-continuum plugin
Plug 'tpope/vim-obsession'

call plug#end()


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
set background=dark
colorscheme solarized


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


"================.
" Plugin Options |
"----------------'

" Tmuxline
" --------
" My tmuxline layout
source ~/.config/nvim/tmuxline-custom.vim


" Lightline
" ---------
" hide the default mode list
set noshowmode

" set colorscheme and git plugin
let g:lightline = {
    \ 'colorscheme':  'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
    \   },
    \ 'component_function': {
    \   'fugitive': 'LightLineFugitive',
    \   'readonly': 'LightLineReadonly',
    \   'modified': 'LightLineModified'
    \   },
    \ }

" functions for lightline components
function! LightLineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "RO"
    else
        return ""
    endif
endfunction

function! LightLineFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

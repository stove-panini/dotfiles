"
" ~/.vimrc
"

"==========
" PLUGINS |
"---------'
call plug#begin('~/.vim/plugged')

" ui
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'srcery-colors/srcery-vim'
Plug 'tpope/vim-vinegar'

" utils
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

" syntax
Plug 'vim-syntastic/syntastic'
Plug 'pearofducks/ansible-vim'
Plug 'reedes/vim-pencil'
Plug 'rodjek/vim-puppet'
Plug 'vim-python/python-syntax'
Plug 'vim-ruby/vim-ruby'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'phenomenes/ansible-snippets'

call plug#end()

"================
" PLUGIN CONFIG |
"---------------
" Ansible
" -------
let g:ansible_unindent_after_newline = 1
augroup ansible_vim_fthosts
  autocmd!
  autocmd BufNewFile,BufRead */files/*.yml,*/files/*.yaml set filetype=yaml
augroup END

" Lightline w/ plugin integration
" -------------------------------
let g:lightline = {
\    'colorscheme': 'srcery',
\    'active': {
\        'left': [
\          [ 'mode', 'paste' ],
\          [ 'gitbranch', 'readonly', 'filename', 'modified' ],
\          [ 'syntastic' ]
\        ]
\    },
\    'component_function': {
\        'gitbranch': 'gitbranch#name',
\        'syntastic': 'SyntasticStatuslineFlag'
\    },
\}

" Pencil
" ------
let g:pencil#wrapModeDefault = 'soft'
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
    autocmd FileType text         call pencil#init()
augroup END

" Python
" ------
let g:python_highlight_all = 1

" Syntastic
" ---------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Preferred checkers
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_cloudformation_checkers = ['cfn_lint']

" Vinegar
" -------
" hide dotfiles by default
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'


"==========
" OPTIONS |
"---------
let g:srcery_italic = 1
colorscheme srcery

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
" use spaces
set expandtab
" tab size
set tabstop=4
" indent operation (<< and >>) size
set shiftwidth=4
" show tabs if they exist
set list
set listchars=tab:▸·,trail:·
" 2 spaces for Ruby and YAML, please
autocmd FileType ruby,yaml set ts=2 sw=2

" Search
" ------
set ignorecase
set smartcase


"==================
" CUSTOM KEYBINDS |
"-----------------
" map to nothing bc SPACE has a default action (move right)
nnoremap <SPACE> <Nop>
" gotta escape that special character notation
let mapleader = "\<SPACE>"

" split control
nnoremap <leader>- :Sexplore<CR>
nnoremap <leader>\ :Vexplore<CR>
nnoremap <leader>t :terminal<CR>

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
nnoremap <leader><C-p> :PencilToggle<CR>
nnoremap <leader><C-f> :FZF<CR>
nnoremap <leader><C-g> :Rg<CR>

" enter clears search results
nnoremap <leader><CR> :nohlsearch<CR>


"================
" MISCELLANEOUS |
"---------------
" use xclipboard if feature is available
if has('clipboard')
    set clipboard^=unnamed,unnamedplus
endif

" enable mouse because I'm a fraud
set mouse=a

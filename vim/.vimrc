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
" colors
Plug 'stove-panini/smyck-color-scheme'
Plug 'srcery-colors/srcery-vim'
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

" Code
" ------------
" snippet engine & snips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" autocompletion
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/neco-syntax'
" syntax checker
Plug 'vim-syntastic/syntastic'
" better Ruby highlighting
Plug 'vim-ruby/vim-ruby'
" better Python highlighting
Plug 'vim-python/python-syntax'
" puppet syntax highlighting
Plug 'rodjek/vim-puppet'
" cloudformation syntax highlighting / linting
Plug 'speshak/vim-cfn'

" QoL
" ------------
" filepicker improvements
Plug 'tpope/vim-vinegar'
" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" git diff stats
Plug 'airblade/vim-gitgutter'
call plug#end()


"""""""""""""""""""""""""""""
" PLUGIN CONFIG
"""""""""""""""""""""""""""""
" Lightline w/ plugin integration
" -------------------------------
let g:lightline = {
\   'colorscheme': 'srcery',
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
"let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_cloudformation_checkers = ['cfn_lint']

" Pencil
" ------
let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" Vim-Python
" ----------
let g:python_highlight_all = 1
let g:python_highlight_file_headers_as_comments = 1

" Deoplete
" --------
let g:deoplete#enable_at_startup = 1
call deoplete#custom#var('around', {
\   'mark_above': '[↑]',
\   'mark_below': '[↓]',
\   'mark_changes': '[*]',
\})

" Vinegar
" -------
let g:netrw_liststyle = 0
" hide dotfiles
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" vsplits open to the right
let g:netrw_altv = 1

"""""""""""""""""""""""""""""
" OPTIONS
"""""""""""""""""""""""""""""
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
" each indentation level is 4 spaces. tabs are not used
set expandtab
set tabstop=4
" indent operation (<< and >>) size
set shiftwidth=4
" 2 spaces for Ruby and YAML, please
autocmd FileType ruby,yaml set ts=2 sw=2

" Custom Filetypes
" ----------------
autocmd BufNewFile,BufRead *.cform setfiletype yaml.cloudformation

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
nnoremap <leader><C-p> :PencilToggle<CR>
nnoremap <leader><C-f> :FZF<CR>
nnoremap <leader><C-g> :Rg<CR>

" enter clears search results
nnoremap <leader><CR> :nohlsearch<CR>


"""""""""""""""""""""""""""""
" MISCELLANEOUS
"""""""""""""""""""""""""""""
" use xclipboard if feature is available
if has('clipboard')
    set clipboard=unnamed
endif

" enable mouse because I'm a fraud
set mouse=a

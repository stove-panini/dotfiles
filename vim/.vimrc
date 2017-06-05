"
" ~/.vimrc
"

" VIM-PLUG
" --------
call plug#begin('~/.vim/plugged')

" sensible defaults
Plug 'tpope/vim-sensible'

" one colorscheme pack to rule them all!
"Plug 'flazz/vim-colorschemes'

" lightline statusbar
Plug 'itchyny/lightline.vim'

" lightline native colorscheme
Plug 'stove-panini/lightline-colorscheme-native'

" Smyck colorscheme
Plug 'stove-panini/smyck-color-scheme'

" tmux.conf syntax highlight
Plug 'tmux-plugins/vim-tmux'

" easily generate a tmux statusline
Plug 'edkolev/tmuxline.vim'

call plug#end()


" INTERFACE
" ---------
" syntax colors
colorscheme smyck

" lightline colors
let g:lightline = {
      \ 'colorscheme': 'native',
      \ }

" hide default modeline
set noshowmode

" show line number sidebar
set number

" highlight current line
set cursorline

" no line wrap
set nowrap


" FORMATTING
" ----------
" each indentation level is 4 spaces. tabs are not used
set expandtab

" tab key size
set tabstop=4

" indent operation (<< and >>) size
set shiftwidth=4

" ignore case unless a capital is typed
set ignorecase
set smartcase


" CUSTOM KEYBINDS
" ---------------
" tab control works like a web browser
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


" MISCELLANEOUS
" -------------
" use xclipboard if feature is available
if has('clipboard')
    set clipboard=unnamedplus
endif

" enable mouse because I'm a fraud
set mouse=a


" my tmuxline layout
"source ~/.vim/tmuxline-custom.vim


local vim = vim
local Plug = vim.fn['plug#']

-- Plugin List
-------------------------------------------------------------------------------
vim.call('plug#begin', vim.fn.stdpath('data') .. '/site/plugged')

-- ui
Plug('lewis6991/gitsigns.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('srcery-colors/srcery-vim')

-- utils
Plug('airblade/vim-rooter')
Plug('junegunn/fzf')
Plug('junegunn/fzf.vim')
Plug('tpope/vim-repeat')
Plug('tpope/vim-rsi')
Plug('tpope/vim-sensible')
Plug('tpope/vim-surround')

-- language
Plug('hrsh7th/vim-vsnip')     -- use VSCode snippets
Plug('neovim/nvim-lspconfig') -- configurations for various LSPs

-- completion engine & sources
Plug('hrsh7th/nvim-cmp')     -- the completion engine
Plug('hrsh7th/cmp-nvim-lsp') -- neovim builtin LSP client
Plug('hrsh7th/cmp-path')     -- filesystem path
Plug('hrsh7th/cmp-vsnip')    -- snippets

-- syntax
Plug('HiPhish/jinja.vim')
Plug('rodjek/vim-puppet')
Plug('stove-panini/vim-pceas')
Plug('towolf/vim-helm')

vim.call('plug#end')
-------------------------------------------------------------------------------

vim.cmd('silent! colorscheme srcery')

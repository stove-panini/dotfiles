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
Plug('airblade/vim-rooter') -- changes working directory to project root
Plug('junegunn/fzf')        -- fuzzy finder
Plug('junegunn/fzf.vim')    -- fzf wrapper for vim integration
Plug('tpope/vim-repeat')    -- plugin-aware "."
Plug('tpope/vim-rsi')       -- readline keybinds for insert and command mode
Plug('tpope/vim-sensible')  -- nice defaults :)
Plug('tpope/vim-surround')  -- add surroundings in pairs (), {}. "", etc.

-- lsp configs & completion engine & sources
Plug('neovim/nvim-lspconfig') -- default configs for various language servers
Plug('hrsh7th/nvim-cmp')      -- the completion engine
Plug('hrsh7th/cmp-nvim-lsp')  -- cmp source: nvim's language server client
Plug('hrsh7th/cmp-path')      -- cmp source: filesystem path
Plug('hrsh7th/cmp-vsnip')     -- cmp source: snippets
Plug('hrsh7th/vim-vsnip')     -- the snippets themselves

-- syntax
Plug('HiPhish/jinja.vim')
Plug('rodjek/vim-puppet')
Plug('stove-panini/vim-pceas')
Plug('towolf/vim-helm')

vim.call('plug#end')
-------------------------------------------------------------------------------

vim.cmd('silent! colorscheme srcery')

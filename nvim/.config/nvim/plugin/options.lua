-- Allow 24-bit color in the terminal
vim.opt.termguicolors = true

-- Hide default modeline
vim.opt.showmode = false

-- Show line numbers
vim.opt.number = true

-- Highlight current line
vim.opt.cursorline = true

-- No line wrap
vim.opt.wrap = false

-- Use spaces
vim.opt.expandtab = true

-- Tab size
vim.opt.tabstop = 4

-- Indent operation (<< and >>) size
vim.opt.shiftwidth = 4

-- Show tabs and trailing spaces (listchars defined by vim-sensible)
vim.opt.list = true

-- Search case-insensitive unless upper case chars are present
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- All registers use system clipboard
vim.opt.clipboard:append({ 'unnamedplus' })

-- Direction of new splits
vim.opt.splitbelow = true --split/new
vim.opt.splitright = true --vsplit/vnew

-- Disable netrw
vim.g.loaded_netrwPlugin = 1

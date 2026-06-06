-- Allow 24-bit color in the terminal
Opt.termguicolors = true

-- Hide default modeline
Opt.showmode = false

-- Show line numbers
Opt.number = true

-- Highlight current line
Opt.cursorline = true

-- No line wrap
Opt.wrap = false

-- Use spaces
Opt.expandtab = true

-- Tab size
Opt.tabstop = 4

-- Indent operation (<< and >>) size
Opt.shiftwidth = 4

-- Show tabs and trailing spaces (listchars defined by vim-sensible)
Opt.list = true

-- Search case-insensitive unless upper case chars are present
Opt.ignorecase = true
Opt.smartcase = true

-- All registers use system clipboard
Opt.clipboard:append({ "unnamedplus" })

-- Direction of new splits
Opt.splitbelow = true --split/new
Opt.splitright = true --vsplit/vnew

-- Disable netrw
G.loaded_netrwPlugin = 1

require('functions')

-- Allow fzf window to be closed with Esc
AutoCmd('FileType', {
  pattern = 'fzf',
  callback = function()
    vim.keymap.set('t', '<ESC>', '<C-c>', { buffer = true })
  end
})

-- Start at project root (w/ vim-rooter)
Map('n', '<leader>o', vim.cmd.Files)

-- Start in current directory
Map('n',
  '<leader>O',
  function() vim.cmd.Files(vim.fn.expand('%:p:h')) end
)

-- Start in ~/Projects
Map('n',
  '<leader><A-o>',
  function() vim.cmd.Files(vim.fn.expand('~/Projects')) end
)

-- Ripgrep
Map('n', '<leader>f', vim.cmd.Rg)

-- Keybinds for opening files from fzf window
vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-n'] = 'split',
  ['ctrl-v'] = 'vsplit'
}

-- Initialize configuration dictionary
vim.g.fzf_vim = {}

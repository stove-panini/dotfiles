require('functions')

-- Set leader key to space
Map('n', '<Space>', '<nop>')
vim.g.mapleader = ' '

-- Split control
Map('n', '<C-w>n', vim.cmd.new)
Map('n', '<C-w>v', vim.cmd.vnew)
Map('n', '<C-w>N', vim.cmd.split)
Map('n', '<C-w>V', vim.cmd.vsplit)

-- Tab control
Map('n', 'tc', vim.cmd.tabnew)
Map('n', 'tn', vim.cmd.tabnext)
Map('n', 'tN', vim.cmd.tabprev)

-- Moving lines
-- ref: https://vim.fandom.com/wiki/Moving_lines_up_or_down#Mappings_to_move_lines
Map('n', '<A-j>', ':m .+1<CR>==')
Map('n', '<A-k>', ':m .-2<CR>==')

-- Clear search results with Enter
Map('n', '<leader><CR>', vim.cmd.nohlsearch)

-- Reload nvim config
Map('n', '<leader><C-r>',
  function()
    vim.cmd.source(vim.env.MYVIMRC)
    print('Reloaded' .. vim.env.MYVIMRC)
  end
)

-- Open terminal in a split
Map('n', '<leader>t', function() vim.cmd.vnew('term://%:p:h//bash') end)
Map('n', '<leader>T', function() vim.cmd.new('term://%:p:h//bash') end)

-- Return to normal mode in termal with Esc
Map('t', '<Esc>', '<C-\\><C-n>')

-- Linter messages
Map('n', '<Tab>', vim.diagnostic.open_float)
Map('n', '[d', vim.diagnostic.goto_prev)
Map('n', ']d', vim.diagnostic.goto_next)
Map('n', '<leader>l', vim.diagnostic.setloclist)

-- Only map LSP keybinds when a language server is available
vim.api.nvim_create_autocmd('LspAttach', {
  pattern = '*',
  callback = function()
    Map('n', 'gd', vim.lsp.buf.definition, { buffer = true })
    Map('n', 'gD', vim.lsp.buf.declaration, { buffer = true })
    Map('n', 'gi', vim.lsp.buf.implementation, { buffer = true })
    Map('n', 'gt', vim.lsp.buf.type_definition, { buffer = true })
    Map('n', 'gr', vim.lsp.buf.references, { buffer = true })
    Map('n', 'K', vim.lsp.buf.hover, { buffer = true })
    Map('n', '<C-n>', vim.lsp.buf.rename, { buffer = true })
    Map('n', '<C-f>', vim.lsp.buf.format, { buffer = true })
  end
})

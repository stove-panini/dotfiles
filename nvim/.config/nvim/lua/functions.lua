-- Nicer versions of Vim API bits

AutoCmd = vim.api.nvim_create_autocmd
AuGroup = vim.api.nvim_create_augroup

function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.keymap.set(mode, lhs, rhs, options)
end

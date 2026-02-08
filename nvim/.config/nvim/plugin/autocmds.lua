require('functions')

-- Format document before saving
AutoCmd('BufWritePre', {
  pattern = '*',
  callback = function()
    vim.fn['user#TrimWhitespace'](1)
    vim.lsp.buf.format()
  end
})

-- Terminal
local augroup_terminal = AuGroup('terminal', { clear = true })

local augroup_terminal_commands = {
  {
    event = { 'TermOpen', 'BufEnter' },
    pattern = 'term://*',
    callback = function() vim.cmd.startinsert() end
  },
  {
    event = 'TermOpen',
    pattern = '*',
    callback = function()
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
      vim.opt_local.cursorline = false
    end
  },
  {
    event = 'TermClose',
    pattern = '*',
    callback = function() vim.cmd('bdelete!') end
  }
}

for _, config in ipairs(augroup_terminal_commands) do
  AutoCmd(config.event, {
    group = augroup_terminal,
    pattern = config.pattern,
    callback = config.callback
  })
end

-- Filetype overrides
local augroup_ft = AuGroup('ft', { clear = true })

local augroup_ft_commands = {
  {
    pattern = 'sh',
    callback = function()
      vim.opt_local.sw = 4
      vim.opt_local.ts = 4
    end
  },
  {
    pattern = 'sh',
    callback = function()
      vim.opt_local.sw = 4
      vim.opt_local.ts = 4
    end
  },
  {
    pattern = { 'ruby', 'yaml', 'vim', 'lua', 'terraform' },
    callback = function()
      vim.opt_local.sw = 2
      vim.opt_local.ts = 2
    end
  },
  {
    pattern = { 'markdown', 'mkd', 'text' },
    callback = function()
      vim.opt_local.wrap = true
      vim.opt_local.linebreak = true
    end
  },
  {
    pattern = { 'markdown', 'mkd' },
    callback = function()
      vim.opt_local.conceallevel = 2
      vim.opt_local.modeline = false
    end
  },
  {
    pattern = 'pceas',
    callback = function()
      vim.opt_local.list = false
      vim.opt_local.expandtab = false
      vim.opt_local.sw = 8
      vim.opt_local.ts = 8
    end
  }
}

for _, config in ipairs(augroup_ft_commands) do
  AutoCmd('FileType', {
    group = augroup_ft,
    pattern = config.pattern,
    callback = config.callback
  })
end

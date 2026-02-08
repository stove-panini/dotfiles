require('functions')

local ft_overrides = {
  ['yaml.ansible'] = '*/ansible/*/[^.]*.yml',
  ansible_hosts = '*/ansible/*/hosts',
  puppet = '*/manifests/*.pp',
  pceas = { '*/pce/*/*.asm', '*/pce/*/*.inc' }
}

for filetype, pattern in pairs(ft_overrides) do
  AutoCmd({ 'BufNewFile', 'BufRead' }, {
    pattern = pattern,
    callback = function() vim.opt_local.ft = filetype end
  })
end

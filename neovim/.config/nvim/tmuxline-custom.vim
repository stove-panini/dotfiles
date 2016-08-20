let g:tmuxline_preset = {
    \'a'    :   '#S',
    \'b'    :   '@#h',
    \'c'    :   ['#(~/.tmux/scripts/tmuxline-nm.sh)', ''],
    \'win'  :   '#I: #W',
    \'cwin' :   '#I: #W #F',
    \'x'    :   '',
    \'y'    :   ['#(~/.tmux/scripts/tmuxline-cpu.sh)', '#(~/.tmux/scripts/tmuxline-mem.sh)', '#(~/.tmux/scripts/tmuxline-disk.sh)'],
    \'z'    :   '%a %d %b %l:%M %p'}

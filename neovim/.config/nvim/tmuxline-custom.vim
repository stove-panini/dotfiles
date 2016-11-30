let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
    \'a'    :   '#S',
    \'b'    :   '',
    \'c'    :   '',
    \'win'  :   '#I: #W #F',
    \'cwin' :   '#I: #W #F',
    \'x'    :   '',
    \'y'    :   ['#(~/.tmux/scripts/tmuxline-nm.sh)', '#(~/.tmux/scripts/tmuxline-cpu.sh)', '#(~/.tmux/scripts/tmuxline-mem.sh)', '#(~/.tmux/scripts/tmuxline-disk.sh)'],
    \'z'    :   '@#H',
    \'options' : {'status-justify' : 'left'}}

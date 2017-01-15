" Use like so...
"   :Tmuxline vim_statusline_3
"   :TmuxlineSnapshot! ~/.tmux/tmuxline.conf
"
" Changes to make in ~/.tmux/tmuxline.conf:
"   comment out status-utf8 (depreciated)
"   change status-right-length to 150

let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
    \'a'    :   '#S',
    \'b'    :   '',
    \'c'    :   '',
    \'win'  :   '#I: #W #F',
    \'cwin' :   '#I: #W #F',
    \'x'    :   '@#H',
    \'y'    :   ['#(~/.tmux/scripts/net.sh)', '#(~/.tmux/scripts/cpu.sh)', '#(~/.tmux/scripts/mem.sh)', '#(~/.tmux/scripts/disk.sh)', '#(~/.tmux/scripts/bat.sh)'],
    \'z'    :   '%a %e %b, %H:%M',
    \'options' : {'status-justify' : 'left'}}

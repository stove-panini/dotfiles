# For the love of god, no Ctrl+S, Ctrl+Q
stty -ixon -ixoff

# Setup colors for prompt
declare -A PROMPT_CONFIG
export PROMPT_CONFIG=(
    [0]=user
    [user_color]=bright_green

    [1]=host
    [host_vpnonly]=true # Only show hostname when connected to VPN
    [host_vpncolor]=cyan

    [2]=path
    [path_color]=white

    [3]=git
    [git_color]=yellow

    [4]=ec
    [ec_color]=bright_red

    [10]=icon
    [icon_color]=white
    [icon_char]=">"
    [icon_style]=bold
)

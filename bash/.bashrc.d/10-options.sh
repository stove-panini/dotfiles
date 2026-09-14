# For the love of god, no Ctrl+S, Ctrl+Q
stty -ixon -ixoff

# Setup colors for prompt
declare -A PROMPT_CONFIG
export PROMPT_CONFIG=(
    [0]=user
    [user_style]=bright_green

    [1]=host
    [host_style]=green
    [host_vpnstyle]=cyan

    [2]=path
    [path_style]=white

    [3]=git
    [git_style]=yellow

    [4]=ec
    [ec_style]=bright_red

    [10]=icon
    [icon_char]=">"
    [icon_style]="white bold"
)

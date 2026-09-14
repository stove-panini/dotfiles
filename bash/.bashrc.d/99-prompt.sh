# Configuration should go in ~/.bashrc.d/10-options.sh

# Default layout. Color defaults are defined in each module.
if [[ -z ${PROMPT_CONFIG[*]} ]]; then
    declare -A PROMPT_CONFIG=(
        [0]=user
        [1]=host
        [2]=path
        [3]=git
        [4]=ec
        [10]=icon
    )
fi

declare -A __SGR=(
    [reset]=0
    [default]=39

    #* = support depends on the terminal emulator
    [bold]=1
    [dim]=2 #*
    [italic]=3
    [underline]=4
    [blinking]=5 #*
    [inverse]=7
    [hidden]=8 #*
    [strikethrough]=9 #*

    [black]=30
    [red]=31
    [green]=32
    [yellow]=33
    [blue]=34
    [magenta]=35
    [cyan]=36
    [white]=37

    [bright_black]=90
    [bright_red]=91
    [bright_green]=92
    [bright_yellow]=93
    [bright_blue]=94
    [bright_magenta]=95
    [bright_cyan]=96
    [bright_white]=97
)

__ps1_sgr() {
    # Returns an escape code for formatting text
    local -a params=()
    local arg

    for arg; do
        if [[ ! -v __SGR[$arg] ]]; then
            printf 'sgr: unknown attribute: %s\n' "$arg" >&2
            return 1
        fi

        params+=("${__SGR[$arg]}")
    done

    # Octal escapes must be used for brackets when dynamically evaluatng a
    # function call in PS1. (e.g. '\001' instead of '\[')
    local IFS=';'
    printf '\001\033[%sm\002' "${params[*]}"
}

__ps1_print() {
    local text=$1
    local style=$2
    local space=$3

    # shellcheck disable=SC2086
    __ps1_sgr $style
    printf "%s" "$text"
    __ps1_sgr reset
    [[ $space == false ]] || printf " "
}

# Prompt modules
# =============================================================================
__ps1_ec() {
    # Show exit code of last process if non-zero

    local style=${PROMPT_CONFIG[ec_style]:-bright_red bold}
    local space=${PROMPT_CONFIG[ec_space]:-true}

    if (( _LAST_EC != 0 )); then
        __ps1_print "[$_LAST_EC]" "$style" "$space"
    fi
}

__ps1_user() {
    # Prints the current user

    local style=${PROMPT_CONFIG[user_style]:-bright_blue}
    local space=${PROMPT_CONFIG[user_space]:-false}

    __ps1_print "$USER" "$style" "$space"
}

__ps1_host() {
    # Prints the hostname with a leading "@"

    local style=${PROMPT_CONFIG[host_style]:-blue}
    local space=${PROMPT_CONFIG[host_space]:-true}
    local vpnstyle=${PROMPT_CONFIG[host_vpnstyle]:-cyan}
    local vpnonly=${PROMPT_CONFIG[host_vpnonly]:-false}

    # Check the hostname rather than rely on $HOSTNAME
    local hostname
    hostname=$(hostname)

    # Check if connected to a VPN
    if scutil --nc list | grep -q Connected; then
        # Use VPN colors
        __ps1_print "@${hostname%%.*}" "$vpnstyle" "$space"
    elif [[ $vpnonly == true ]]; then
        # Print a space if we're only showing the hostname when on a VPN
        printf ' '
    else
        # Use normal colors
        __ps1_print "@${hostname%%.*}" "$style" "$space"
    fi
}

__ps1_path() {
    # Prints the cwd, truncating the left-most directories to fit the window

    local style=${PROMPT_CONFIG[path_style]:-white}
    local space=${PROMPT_CONFIG[path_space]:-true}
    local limit=${PROMPT_CONFIG[path_limit]:-40}
    local result dirparts sub

    result="${PWD/#$HOME/\~}" # substitute $HOME with ~

    # Return early if not over the character limit or checkwinsize is not on
    if (( ${#result} <= limit )) || [[ -z $COLUMNS ]]; then
        __ps1_print "[${result}]" "$style" "$space"
        return
    fi

    # Redefine limit based on terminal window width
    limit=$(( COLUMNS - 40 ))

    # Split path into array of directory names
    IFS=/ read -ra dirparts <<<"${result}"

    # Substitute directory names with their first letter until the length of
    # result is less than the character limit
    for d in "${dirparts[@]}"; do
        if (( ${#result} > limit )); then
            sub="${d:0:1}" # first character of directory
            result="${result/$d/$sub}"
        else
            break
        fi
    done

    __ps1_print "[${result}]" "$style" "$space"
}

__ps1_icon() {
    # Prints the icon just before text entry. A trailing space is included.

    local style=${PROMPT_CONFIG[icon_style]:-white}
    local space=${PROMPT_CONFIG[icon_space]:-true}
    local char=${PROMPT_CONFIG[icon_char]:-"$"}

    __ps1_print "$char" "$style" "$space"
}

__ps1_time() {
    # Prints the current time

    local style=${PROMPT_CONFIG[time_style]:-white}
    local space=${PROMPT_CONFIG[time_space]:-true}
    local format=${PROMPT_CONFIG[time_format]:-"+%R"}

    __ps1_print "[$(date "$format")]" "$style" "$space"
}

__ps1_git() {
    # Show git branch/tag when in a git repo

    local style=${PROMPT_CONFIG[git_style]:-yellow}
    local space=${PROMPT_CONFIG[git_space]:-true}

    # Ensure git is available
    type git &>/dev/null || return

    local result branch tag changes
    branch="$(git branch --show-current 2>/dev/null || :)"
    tag="$(git describe --tags --exact-match 2>/dev/null || :)"

    # Return if not in a git repo
    [[ $branch || $tag ]] || return

    changes="$(git status --short 2>/dev/null || :)"

    if [[ $tag ]]; then
        result="◆ ${tag}"
    else
        result=" ${branch}"
    fi

    [[ -z $changes ]] || result+="*"

    __ps1_print "[${result}]" "$style" "$space"
}

__ps1_msg() {
    # Whatever you want it to say! Perhaps the output of a script...
    # Colors and styles can be set in the message itself:
    #     [msg_text]="$(tput setaf1 )red text!"
    #
    # Or a script can be sourced instead:
    #     [msg_text]="$(~/.bin/my_script.sh)"

    local style=${PROMPT_CONFIG[msg_style]:-default}
    local space=${PROMPT_CONFIG[msg_space]:-true}
    local text=${PROMPT_CONFIG[msg_text]:-"your text here"}

    __ps1_print "$text" "$style" "$space"
}

# Prompt module ordering
# =============================================================================
_set_ec() {
    # Store the value of $? so we can act on it in PS1
    # This must be the first thing called by PROMPT_COMMAND
    _LAST_EC=$?
}

_set_ps1() {
    unset PS1

    # I imagine 3 lines are all you'll ever need...
    for i in {0..30}; do
        # Ensure position has a module defined
        [[ -n ${PROMPT_CONFIG[$i]} ]] || continue

        # New line every 10 modules
        if [[ $i != 0 && $(( i % 10 )) == 0 ]]; then
            PS1+='\n'
        fi

        # Add function call to PS1 but don't interpolate it yet!
        # shellcheck disable=SC2016
        PS1+=$(printf '$(__ps1_%s)' "${PROMPT_CONFIG[$i]}")

        # If we're at the icon module, stop
        [[ ! ${PROMPT_CONFIG[$i]} == icon ]] || break
    done
}

if [[ -z $PROMPT_COMMAND ]]; then
    PROMPT_COMMAND=(_set_ec)
fi

# Preserve existing PROMPT_COMMAND
if [[ ${PROMPT_COMMAND[0]} != _set_ec ]]; then
    PROMPT_COMMAND=(_set_ec "${PROMPT_COMMAND[@]}")
fi

_set_ps1

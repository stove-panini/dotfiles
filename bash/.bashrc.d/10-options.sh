# For the love of god, no Ctrl+S, Ctrl+Q
stty -ixon -ixoff

# Setup colors for prompt
declare -A PROMPT_THEME
if [[ $SSH_CONNECTION ]]; then
    export PROMPT_THEME=([user]='bright_cyan' [host]='cyan')
fi

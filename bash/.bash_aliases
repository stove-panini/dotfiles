# cd'n around
alias ..='cd ..'            # go up one directory
alias ...='cd ../..'        # go up two
alias ....='cd ../../..'    # go up three
alias cdd='cd -'            # go back to previous dir

# file mgmt
LS_OPTIONS='-F -h --group-directories-first --color=auto'
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias la='ls $LS_OPTIONS -lA'
alias grep='grep -i --color=auto'
alias md='mkdir -p'         # create parent directories if needed
alias rd='rmdir'
alias cp='cp -ir'           # copy dir contents / warn if overwriting
alias mv='mv -i'            # warn if overwriting

# make it easy
alias q='exit'

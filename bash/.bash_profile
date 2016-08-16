#
# ~/.bash_profile: executed by the login shell
# 

# GNOME willfully ignores .bash_profile, yet TMUX sources it with every new pane.
# So let's just make things easy and depreciate it, moving all settings to .bashrc

# Source .bashrc and call it a day.
[[ -f ~/.bashrc ]] && . ~/.bashrc

dotfiles
========
Configs for my MacOS terminal environment.

---

Two things here: configs and a package installer script.

The config files are intended to be placed using GNU Stow.

The `deploy.sh` script takes care of not only placing the configs, but also installing packages using `brew`, `npm`, `pipx`, `gem`, etc. Everything can be quickly upgraded by running `./deploy.sh upgrade`.

Notes
-----
### Bash prompt
The script for setting the bash prompt (bash/bashrc.d/[99-prompt.sh](bash/.bashrc.d/99-prompt.sh)) uses a modular system of info blocks configured with the associative array `${PROMPT_CONFIG[@]}`. An example is found in [10-options.sh](bash/.bashrc.d/10-options.sh).

The order of the blocks are set with numerical keys (`[0]=user`, `[1]=host`, etc) and the blocks themselves are configured with keys like `[host_color]=blue` and `[time_format]="+%T"`.

A newline is inserted every 10 positions, so `[0]=user [1]=host [2]=path [10]=icon` would put user, host, and path on the first line and icon ($) on the second.

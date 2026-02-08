dotfiles
========
Configs for my MacOS terminal environment.

---

Two things here: configs and a package installer script.

The config files are intended to be placed using GNU Stow.

The `deploy.sh` script takes care of not only placing the configs, but also installing packages using `brew`, `npm`, `pipx`, `gem`, etc. Everything can be quickly upgraded by running `./deploy.sh upgrade`.

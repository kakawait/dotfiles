# ls
alias ls='ls --color=auto'
alias ll='ls -l'

# directories
alias dotfiles="cd ${DOTFILES}"

# yarn
## XDG
alias yarn='yarn --use-yarnrc "${XDG_CONFIG_HOME:-${HOME}/.config}/yarn/config"'

# maven
## XDG
alias mvn='mvn --global-settings "${XDG_CONFIG_HOME:-${HOME}/.config}/maven/settings.xml"'
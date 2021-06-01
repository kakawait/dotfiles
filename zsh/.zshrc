export ZSH_CONFIG_PATH=${XDG_CONFIG_HOME:-${HOME}/.config}/zsh

##
# History settings
# Set these before calling any commands, so history doesn't get lost when something breaks.
#
HISTFILE=${ZSH_CONFIG_PATH}/history
SAVEHIST=$(( 100 * 1000 ))
HISTSIZE=$(( 1.2 * SAVEHIST ))  # Zsh recommended value
setopt histfcntllock histignorealldups histsavenodups sharehistory

export DOTFILES=${HOME}/projects/dotfiles

# Source Znap at the start of your .zshrc file.
source ~/.config/zsh/plugins/zsh-snap/znap.zsh

znap eval starship 'starship init zsh --print-full-init'
znap prompt

#if (which starship > /dev/null) then
#  eval "$(starship init zsh)"
#fi

## PLUGINS
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
znap source zsh-users/zsh-autosuggestions

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting

#znap source marlonrichert/zsh-autocomplete

znap source marlonrichert/zsh-hist

## BINDKEYS
bindkey "^[[3~" delete-char
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
fi

## ALIASES
source ${ZSH_CONFIG_PATH}/aliases.zsh

## PATH
source ${ZSH_CONFIG_PATH}/path.zsh

## COMPLETIONS
znap function _hugo 'znap eval hugo-completion "hugo gen autocomplete --type zsh"'
compdef _hugo hugo

if [ -f /usr/share/nvm/init-nvm.sh ]; then
  source /usr/share/nvm/init-nvm.sh
fi

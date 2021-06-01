# This zshenv is entirely for setting up XDG-compatible locations for the
# remaining zsh files. No other content should be put here. Lines which would
# normally go in ~/.zshenv should instead go in $ZDOTDIR/environments.zsh.

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=${HOME}/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:=${HOME}/.local/share}"
export ZDOTDIR="${ZDOTDIR:=${XDG_CONFIG_HOME}/zsh}"
if [[ -r "${ZDOTDIR}/environments.zsh" ]]; then
  source "${ZDOTDIR}/environments.zsh"
fi
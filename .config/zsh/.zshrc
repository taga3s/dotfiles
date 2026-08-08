export HOMEBREW_FORBIDDEN_FORMULAE="node python python3 pip npm pnpm yarn claude"

#######################
### PATHS & ALIASES ###
#######################

export PATH="$HOME/.local/bin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

alias proot='cd $(git rev-parse --show-toplevel)'

#################
### BOOTSTRAP ###
#################

eval "$(starship init zsh)"

# fuzzy finder (ctrl+f)
function ghq-fzf() {
  local src=$(ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.*")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^f' ghq-fzf

###################
### COMPLETIONS ###
###################

# zsh-completions
if [[ ":$FPATH:" != *":$HOME/completions:"* ]]; then export FPATH="$HOME/completions:$FPATH"; fi
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit && compinit
fi

# terraform
autoload -Uz +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# terraform-docs
terraform-docs completion zsh > $(brew --prefix)/share/zsh/site-functions/_terraform-docs
autoload -Uz compinit && compinit


####################
### APPLICATIONS ###
####################

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# Vite+
. "$HOME/.vite-plus/env"


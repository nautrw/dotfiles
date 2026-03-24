### Variables
export PATH="$PATH:/home/$USER/.local/bin:/home/$USER/.local/share/nvim/mason/bin"
export EDITOR="nvim" export STARSHIP_CONFIG=~/.config/starship/starship.toml ## History
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
setopt SHARE_HISTORY

### Keys
bindkey '^[[1;5D' backward-word  # ctrl + left
bindkey '^[[1;5C' forward-word   # ctrl + right
bindkey '^H' backward-kill-word # ctl + backspace

### Aliases
alias ols="ls" # the original ls
alias ls="exa"

alias ocat="cat" # the original cat
alias cat="bat"

### Python Venvs
autoload -Uz add-zsh-hook
add-zsh-hook precmd automatically_activate_python_venv

function automatically_activate_python_venv() {
  if [[ -z $VIRTUAL_ENV ]]; then
    activate_venv
  else
    parentdir="$(dirname ${VIRTUAL_ENV})"
    if [[ "$PWD"/ != "$parentdir"/* ]]; then
      deactivate
      activate_venv
    fi
  fi
}

function activate_venv() {
  local d n
  d=$PWD
  until false; do
    if [[ -f $d/.venv/bin/activate ]]; then
      source $d/.venv/bin/activate
      break
    fi
    d=${d%/*}
    [[ $d = *\/* ]] || break
  done
}

# Prompt
setopt prompt_subst
setopt interactivecomments transientrprompt
autoload -Uz vcs_info
precmd () { vcs_info }

# zstyle ':vcs_info:*' formats ' %F{blue}(git:%F{yellow}%b%F{blue})%f'
# PS1='%F{cyan}%~%f$vcs_info_msg_0_ %(?.%F{green}.%F{red})➜%b%f '

### Plugins
zstyle ':completion:*' squeeze-slashes true
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
zstyle ':autocomplete:*' add-semicolon no

### Starship
eval "$(starship init zsh)"

### Open command buffer in editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

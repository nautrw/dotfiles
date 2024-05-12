### Aliases
alias fucking="sudo"
alias ls="exa"
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

### Prompt
setopt prompt_subst
autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:*' formats ' %F{blue}(git:%F{yellow}%b%F{blue})%f'

PS1='%F{cyan}%~%f$vcs_info_msg_0_ %(?.%F{green}.%F{red})➜%b%f '

### Plugins
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

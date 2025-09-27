plugins=(
  zsh-syntax-highlighting # https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
  colored-man-pages
  gitfast
  golang
  zoxide # z
  fzf # <C-r> and <C-t> search, <M-c> fzf cd and ** search on path
  tmux
  git 
)

# set -o vi

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases.zsh

[ ! -d ~/.cache/zsh ] && mkdir -p ~/.cache/zsh
[ ! -f ~/.cache/zsh/history ] && touch ~/.cache/zsh/history
HISTFILE=~/.cache/zsh/history
HIST_STAMPS="dd/mm/yyyy"

typeset -A ZSH_HIGHLIGHT_STYLES
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
export ZSH_HIGHLIGHT_STYLES[command]='fg=cyan'
#export ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=black'
export ZSH_HIGHLIGHT_STYLES[alias]='fg=blue'

# Color shortcuts
R=$fg_no_bold[red]
B=$fg_no_bold[blue]
M=$fg_no_bold[magenta]
RESET=$reset_color

local return_side="%(?..%{$R%}   %{$RESET%})"

# Prompt
PROMPT='%{$M%}%B%1~%b%{$RESET%} %{$M%}%{$RESET%}'
RPS1="${return_side}"

function tmux-start() {
  if [[ $- == *i* ]] && [[ -z "$TMUX" ]]; then
    tmux attach-session -t master 2>/dev/null || \
      tmux new-session -s master
  fi
}

#tmux-start

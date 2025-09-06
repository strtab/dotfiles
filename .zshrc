plugins=(git fasd colored-man-pages) #  zsh-autosuggestions

zstyle ':omz:update' mode automatic      # update automatically without asking
source $ZSH/oh-my-zsh.sh

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

HISTFILE=~/.cache/zsh/history
HIST_STAMPS="dd/mm/yyyy"

# Color shortcuts
R=$fg_no_bold[red]
B=$fg_no_bold[blue]
M=$fg_no_bold[magenta]
RESET=$reset_color

local return_side="%(?..%{$R%}%?   %{$RESET%})"

function gitStatusF() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    user=$(git remote -v | grep "fetch" | cut -d'/' -f 4) || return
    repo=$(git remote -v | grep "fetch" | cut -d'/' -f 5 | cut -d'.' -f 1) || return
    echo "(%B${ref#refs/heads/}@${user}/${repo}%b%{$RESET%}) "
}

# Prompt
PROMPT='%{$M%}%B%1~%b%{$RESET%} %{$M%}%{$RESET%}'
RPS1="${return_side}"

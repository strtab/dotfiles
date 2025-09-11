alias ran='ranger'
alias ip='ip -c=auto'
alias du='du -hs'
alias gh='history|grep'
alias tmux='tmux -f ~/.dotfiles/tmux/tmux.conf'

if [ $TERM = 'xterm-kitty' ]; then
  alias ssh='kitten ssh' 
fi

# bat hightlights
alias cat='bat'
alias ports='ss -tulpan | bat -l log'
alias cpuinfo='bat -l cpuinfo /proc/cpuinfo'
alias df='df -h 2>&1 | bat -l lua'
alias free='free -h 2>&1 | bat -l cpuinfo'
alias head='head 2>&1 | bat -l log'
alias tail='tail 2>&1 | bat -l log --paging=never'
alias lsblk='lsblk -i -o NAME,FSTYPE,SIZE,FSUSE%,MOUNTPOINTS,UUID 2>&1 | bat -l conf'
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# neovim
alias vi='nvim'
alias svi='sudo nvim'

# eza
alias tree='eza --tree -L 2'
alias ls='eza'
alias l='eza -la --no-time'
alias la='eza -la --no-time'
alias ll='eza -l --no-time'

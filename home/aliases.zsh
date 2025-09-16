alias ip='ip -c=auto'
alias du='du -hs'
alias gh='history|grep'

# if [ $TERM = 'xterm-kitty' ]; then
#   alias ssh='kitten ssh' 
# fi

# bat hightlights
alias cat='bat --no-pager'
alias ports='ss -tulan | bat -l log'
alias cpuinfo='bat -l cpuinfo /proc/cpuinfo'
alias df='df -hx tmpfs -x efivarfs -x swap 2>&1 | bat -l lua'
alias free='free -h 2>&1 | bat -l cpuinfo'
alias lsblk='lsblk -i -o NAME,FSTYPE,SIZE,FSUSE%,MOUNTPOINTS,UUID 2>&1 | bat -l conf'
alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
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

alias j='jobs'
alias ip='ip -c=auto'
alias gc='git clone --depth 1'
alias du='du -hs'
alias ysap='curl style.ysap.sh &>/dev/null | less'
alias procs="ps -eo uid,exe | grep $UID | awk '{print $2}' | xargs -n1 basename | sort | uniq -c | fzf --no-preview"
alias ku="kubectl"

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
alias ll='eza -la --no-time'
alias la='eza -a --no-time'
alias l='eza -l --no-time'

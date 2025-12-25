##### Common
alias j='jobs'
alias ip='ip -c=auto'
alias du='du -hs'
alias ku="kubectl"
alias e='echo "$?"'

##### Bat hightlights
alias cat='bat --no-pager'
alias ports='ss -tulan | bat -l log'
alias cpuinfo='bat -l cpuinfo /proc/cpuinfo'
alias df='df -hx tmpfs -x efivarfs -x swap 2>&1 | bat -l lua'
alias free='free -h 2>&1 | bat -l cpuinfo'
alias lsblk='lsblk -i -o NAME,FSTYPE,SIZE,FSUSE%,MOUNTPOINTS,UUID 2>&1 | bat -l conf'
alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain' 

# unalias l
# l() {
#   ls -l -p -h --literal --sort=extension --time-style=long-iso -G "$@" |\
#     awk 'NR==1 {print; next} {print $1, $3, $7, $8, $9}' |\
#     bat --no-pager --style=plain -l fstab
# }

# unalias ll
# ll() {
#   ls -l -p -A -h --literal --sort=extension --time-style=long-iso -G "$@" |\
#     awk 'NR==1 {print; next} {print $1, $3, $7, $8, $9}' |\
#     bat --no-pager --style=plain -l fstab
# }

##### Eza
alias tree='eza --tree -L 2'
alias ll='eza -la --no-time'
alias la='eza -a --no-time'
alias l='eza -l --no-time'
alias ls='eza' 

##### neovim
alias vi='nvim'
alias svi='sudo -e' # this use $EDITOR variable

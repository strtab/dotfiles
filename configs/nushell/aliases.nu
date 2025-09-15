# Basic aliases
alias ran = ranger
alias ip = ip -c=auto
alias tmux = tmux -f ~/.dotfiles/tmux/tmux.conf

def confdoc [] { 
  config nu --doc | nu-highlight | bat -l conf 
}

# bat highlights
alias cpuinfo = bat -l cpuinfo /proc/cpuinfo

def ports [...args] {
  ^ss -tulan | lines | table | bat -l log 
} 

# df with error handling
def df [...args] {
    ^df -hx tmpfs -x efivarfs -x swap | bat -l lua
}

# fzf with bat preview
def fzf [...args] {
    ^fzf --preview "bat -l conf --color=always --style=numbers --line-range=:500 {}" ...$args
}

# Help wrappers
def h [cmd: string, ...args] {
    ^$cmd --help ...$args | bat --language=help --style=plain
}

# neovim
alias vi = nvim
alias svi = sudo nvim

# eza
alias tree = eza --tree -L 2
# alias l = eza -la --no-time
# alias la = eza -la --no-time
# alias ll = eza -l --no-time

# ls
alias l = ls -la -s
alias la = ls -la -s
alias ll = ls -l -s

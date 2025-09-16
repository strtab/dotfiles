# Conditional ssh alias for kitty
if ($env.TERM? == "xterm-kitty") {
    alias ssh = kitten ssh
}

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
  ^ss -tulan ...$args | lines | table | bat -l log 
} 

# df with error handling
def df [...args] {
    ^df -hx tmpfs -x efivarfs -x swap ...$args | bat -l lua --style grid
}

# fzf with bat preview
def fzf [...args] {
    ^fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" ...$args
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
def l [...args] {
  ls -la -s ...$args | reject mode target created accessed modified inode num_links
} 
def la [...args] {
  ls -la -s ...$args | reject mode target created accessed modified inode num_links
} 
def ll [...args] {
  ls -l -s | reject mode target created accessed modified inode num_links
} 

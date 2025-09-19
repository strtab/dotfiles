# Conditional ssh alias for kitty
if ($env.TERM? == "xterm-kitty") {
    alias ssh = kitten ssh
}

# Basic aliases
alias ran = ranger
alias ip = ip -c=auto

def confdoc [] { 
  config nu --doc | nu-highlight | bat -l conf 
}

# bat highlights
alias cpuinfo = bat -l cpuinfo /proc/cpuinfo

def ports [...args] {
  ^ss -tulan ...$args | lines | bat -l log
} 

def df [...args] {
    ^df -hx tmpfs -x efivarfs -x swap ...$args | lines | bat -l lua
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
def vi [...args] {
  nvim ...$args
} 
def svi [...args] {
  sudo nvim ...$args
} 

# eza
alias tree = eza --tree -L 2
# alias l = eza -la --no-time
# alias la = eza -la --no-time
# alias ll = eza -l --no-time

# ls
def l [path: path = .] {
  ls -la -s $path | reject mode target created accessed modified inode num_links
} 
def la [path: path = .] {
  ls -la -s $path | reject mode target created accessed modified inode num_links
} 
def ll [path: path = .] {
  ls -l -s $path | reject mode target created accessed modified inode num_links
} 

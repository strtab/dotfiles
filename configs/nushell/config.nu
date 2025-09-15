source ~/.dotfiles/configs/nushell/plugins/zoxide.nu
source ~/.config/nushell/aliases.nu
source ~/.cache/carapace/init.nu

# Conditional ssh alias for kitty
if ($env.TERM? == "xterm-kitty") {
    alias ssh = kitten ssh
}

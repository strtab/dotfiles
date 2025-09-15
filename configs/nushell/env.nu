$env.config.show_banner = "none"

# completion
# $env.config.completions.algorithm = "fuzzy"
$env.config.completions.external.max_results = 20

# integrations
$env.config.use_kitty_protocol = true

# errors 
#$env.config.error_style = "plain"
$env.config.display_errors.exit_code = false

# table
$env.config.footer_mode = "never"
$env.config.table.mode = "single"
$env.config.table.index_mode = "never"
$env.config.table.show_empty = false

# themes
$env.config.highlight_resolved_externals = true

# edit
$env.config.edit_mode = "vi"

# environments
$env.EDITOR = "nvim"
$env.TERMINAL = "kitty"
$env.GOPATH = ($env.HOME | path join ".go")
$env.PATH = ($env.PATH | prepend "~/.local/bin")


$env.PROMPT_COMMAND = {||
  if (pwd) == $nu.home-path {
    (echo "~")
  } else {
  (pwd | path basename) 
  }
}
$env.PROMPT_COMMAND_RIGHT = ""

$env.PROMPT_INDICATOR = " "
$env.PROMPT_INDICATOR_VI_NORMAL = " "
$env.PROMPT_INDICATOR_VI_INSERT = " "
$env.PROMPT_MULTILINE_INDICATOR = " "

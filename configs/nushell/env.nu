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

clear

FG_P="\033[1;35m"
FG_D="\033[2;37m"
RESET="\033[0m"

center() {
  local text="$1"
  local padding=$(( (TERM_WIDTH - ${#text}) / 2))
  if (( padding > 0 )); then
    printf "%*s" "$padding"
    echo -e "$text"
  else
    echo -e "$text"
  fi
}

local TERM_WIDTH=$(tput cols)
if (( TERM_WIDTH >= 100 )); then 
  TERM_WIDTH=$((TERM_WIDTH + 5))
elif (( TERM_WIDTH < 100 )); then
  TERM_WIDTH=$((TERM_WIDTH + 10))
fi

main() {
  if (( $(tput cols) > 60 )); then
    echo ""
    center "${FG_P}  春 の 山${RESET}"
    center "${FG_P}霞 た な び く${RESET}"
    center "${FG_P}  花 の 声${RESET}"
    echo ""
    center "${FG_D}     Spring mountains -${RESET}"
    center "${FG_D}      Mist floats by,${RESET}"
    center "${FG_D}     Voices of flowers.${RESET}"
    echo ""
    center "${FG_D}    - Matsuo Bashō${RESET}"
    echo ""
  fi
}

main

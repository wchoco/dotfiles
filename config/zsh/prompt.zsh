prompt_setup () {
  local text_col=${1:-'green'}
  local fg="%F{$text_col}"

  local host=`hostname | sed -e "s/\..*//"`
  if [ $host = $USERNAME ];then
    local user="%n"
  else
    local user="%n@%m"
  fi

  prompt_newline=$'\n%{\r%}'
  PS1="$fg%S▌$user▐%s%f%S▌%#:%~▐%s$prompt_newline$fg▌%f"
  PS2="$fg▌%f"
}

prompt_setup

_ssh()
{
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts=`cat ~/.ssh/config | grep ^Host | cut -d' ' -f2-`

  # if [[ ${cur} == -* ]] ; then
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    # return 0
  # fi
}

complete -F _ssh ssh

# Function for determining current git branch (if any)
# Gracefully fails if not in a git repo and returns nothing.
__gitBranch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo ${ref#refs/heads/}
}

__gitSha() {
    sha=$(git sha 2> /dev/null) || return
    echo $sha
}

# Retrieves status information for git and places into predefined variables.
__gitStatus() {
    # Initialise git status variables
    __GIT_ADD=0
    __GIT_MOD=0
    __GIT_DEL=0
    __GIT_UNTRACKED=0
    __GIT_AHEAD=0

    while read line; do
	if [[ $line =~ (ahead of .origin/.* by ([0-9]+) commit.*) ]]  ; then
	    __GIT_AHEAD=${BASH_REMATCH[2]}
	elif [[ $line =~ 'deleted:' ]]  ; then
	    __GIT_DEL=$(( $__GIT_DEL + 1 ))
	elif [[ $line =~ 'modified:' || $line =~ 'renamed:' ]]  ; then
	    __GIT_MOD=$(( $__GIT_MOD + 1 ))
	elif [[ $line =~ 'new file:' ]]  ; then
	    __GIT_ADD=$(( $__GIT_ADD + 1 ))
	elif [[ $line =~ '# Untracked files:' ]]  ; then
	    __GIT_UNTRACKED=1
	fi
    done <<< "`git status`"
}

# Logic for determining the contents and setting the prompt
__prompt() {
    __GIT_BRANCH=$(__gitBranch)                 # Current git branch (if any)?
    __GIT_SHA=$(__gitSha)
    #__PROMPT="\[\033[1;32m\]\u@\h \W"           # Default prompt (not in git repo)
    __PROMPT="\u@\h \W"           # Default prompt (not in git repo)

    # Test whether we are in a git repo
    if [ "$__GIT_BRANCH" != "" ] ; then
	__gitStatus                             # Run git status function
	__PROMPT="$__PROMPT \[\033[1;33m\]["    # Open bracket


	# Set correct color for branch name and append name
	if [ $__GIT_AHEAD != 0 ] ; then
	    __PROMPT="$__PROMPT\[\033[1;31m\]"  # Red
	else
	    __PROMPT="$__PROMPT\[\033[1;36m\]"  # Cyan
	fi

	__PROMPT="$__PROMPT$__GIT_BRANCH\[\033[0m\]@\[\033[1;35m\]$__GIT_SHA\[\033[1;33m\]"

	# Added, modified, deleted
	__PROMPT="$__PROMPT +$__GIT_ADD ~$__GIT_MOD -$__GIT_DEL"

	# Untracked files present?
	if [ $__GIT_UNTRACKED != 0 ] ; then
	    __PROMPT="$__PROMPT !"
	fi

	#__PROMPT="$__PROMPT]\[\033[1;32m\]"     # Close bracket
	__PROMPT="$__PROMPT]"     # Close bracket
    fi

    #__PROMPT="$__PROMPT\$\[\033[0m\]"           # Add \$ and reset color
    __PROMPT="$__PROMPT\[\033[0m\]\$"           # Add \$ and reset color

    export PS1="$__PROMPT "                     # Set prompt
}

# Export prompt command and other environment variables
export CLICOLOR=1
export PROMPT_COMMAND=__prompt

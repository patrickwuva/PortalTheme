# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PROMPT_COMMAND='ps1_func'

ps1_func(){
    if [[ "$(pwd)" == "$HOME" ]]; then
        PS1="${BOLD}${BLUE}[ ${CYAN}base ${BLUE}]\n ${CYAN}►${RESET} "
    else
        o=$(git rev-parse --abbrev-ref HEAD)
        if [ "${o:0:5}" ]; then
            PS1="${BOLD}${BLUE}[ ${CYAN}\W ${BLUE}] ${BLUE}[${BOLD}${GREEN}$(git rev-parse --abbrev-ref HEAD)${BLUE}]\n ${CYAN}►${RESET} "
        else
            PS1="${BOLD}${BLUE}[ ${CYAN}\W ${BLUE}]\n ${CYAN}►${RESET} "
        fi
    fi
}

# colors
BOLD="\e[1m"
CLEAR="\e[0m"
CYAN='\[\e[36m\]'
RED='\[\e[31m\]'
GREEN='\[\e[32m\]'
YELLOW='\[\e[33m\]'
BLUE='\[\e[34m\]'
PURPLE='\[\e[35m\]'
RESET='\[\e[m\]'

# User specific aliases and functions
# Load modules automatically on interactive shell
case "$-" in
*i*)    module load git; module load nano; module load clang-llvm-14.0.6;;
*)  ;;
esac

# Enable color support of ls
alias ls='ls --color=auto'

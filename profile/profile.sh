# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Aliases and other shortcuts
alias ll='ls -lhtr'
alias gs='git status'
alias ga='git add'

source $HOME/.prompt.sh

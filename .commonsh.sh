alias g=git
alias gk=gitk
export EDITOR=vim

# {{{ History
export HISTSIZE=400000
export HISTFILESIZE=400000
export HISTIGNORE="ls:l:c:clear:d:cd:dc:bg:fg:jk:h:dl"
export HISTCONTROL=erasedups
export HISTTIMEFORMAT='%m%d %H%M: '

alias be="bundle exec"
alias ls="ls --color=always"
alias ltra="ls -ltra" # list the last modified files
alias ack="ack-grep"
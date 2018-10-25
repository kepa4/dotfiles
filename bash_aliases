# tmux
alias tmux='tmux -2'

# eclipse with menus
# alias eclipse='UBUNTU_MENUPROXY=0 ./eclipse'

# get the git branch
 function parse_git_branch {
     git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
 }
 PS1="\[\e[32m\]\$(parse_git_branch)\[\e[34m\]\h:\W \$ \[\e[m\]"
 export PS1

# git aliases
alias gs='git status -s'
alias gl='git lg'
alias gco='git checkout'

# vim + crontab = <3
alias crontab='VIM_CRONTAB=true crontab'

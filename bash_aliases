(cat ~/.cache/wal/sequences &)
# tmux
alias tmux='tmux -2'

# eclipse with menus
# alias eclipse='UBUNTU_MENUPROXY=0 ./eclipse'

# get the git branch
 function parse_git_branch {
     git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
 }
 PS1="\[\e[91m\]\$(parse_git_branch)\[\e[92m\]\h\[\e[94m\]:\W \$ \[\e[m\]"
 export PS1
export PATH="$PATH:/opt/mssql-tools/bin"
# git aliases
alias gs='git status -s'
alias gl='git lg'
alias gco='git checkout'
alias gd='git diff'
alias c='pygmentize -g'
eval $(thefuck --alias)

# vim + crontab = <3
alias crontab='VIM_CRONTAB=true crontab'

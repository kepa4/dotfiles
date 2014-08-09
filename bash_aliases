# tmux
alias tmux='tmux -2'

# eclipse with menus
# alias eclipse='UBUNTU_MENUPROXY=0 ./eclipse'

# easier connection to myth
alias corn='ssh -t cjeffers@corn.stanford.edu "exec bash"'
alias myth='ssh -t cjeffers@myth.stanford.edu "exec bash"'

# get the git branch
 function parse_git_branch {
 git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
 }
 PS1="\[\e[32m\]\$(parse_git_branch)\[\e[34m\]\h:\W \$ \[\e[m\]"
 export PS1

 # AWS easy ssh
alias otorder-connect='ssh ubuntu@www.otorder.com'

 # git aliases
 alias gs='git status -s'
 alias gl='git lg'
 alias gco='git checkout'

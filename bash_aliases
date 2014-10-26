# tmux
alias tmux='tmux -2'

# eclipse with menus
# alias eclipse='UBUNTU_MENUPROXY=0 ./eclipse'

# easier connection to myth/corn
function init_kerberos_tokens_if_none_exist {
    klist -l | init_kerberos_tokens.py cjeffers@stanford.edu
}

alias corn='init_kerberos_tokens_if_none_exist && ssh -t cjeffers@corn.stanford.edu "exec bash"'
alias myth='init_kerberos_tokens_if_none_exist && ssh -t cjeffers@myth.stanford.edu "exec bash"'

# get the git branch
 function parse_git_branch {
     git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
 }
 PS1="\[\e[32m\]\$(parse_git_branch)\[\e[34m\]\h:\W \$ \[\e[m\]"
 export PS1

 # AWS easy ssh
alias otorder-connect='ssh ubuntu@www.otorder.com'

# tmux startup configured for otorder
alias tmux-otorder='tmux_otorder.sh'

# git aliases
alias gs='git status -s'
alias gl='git lg'
alias gco='git checkout'

# vim + crontab = <3
alias crontab='VIM_CRONTAB=true crontab'

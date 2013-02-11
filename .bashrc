export PATH=$PATH:/home/rob/bin

# Aliases
alias g='git'
alias gch='git checkout'
alias gco='git commit -a'
alias gp='git pull && git push'
alias gph='git push'
alias gpl='git pull'
alias gb='git branch'
alias gst='git status'
alias gft='git fetch --tags'
alias gt='git tag'
alias gm='git merge'
alias gmm='git merge master'
alias gcp='git cherry-pick'
alias gd='git diff'
alias c='cd'
alias l='ls'
alias v='gvim'
alias sb='source bin/activate'
alias py='python'

# Stuff to show the active git branch in the console
function parse_git_branch {
  ref=$(git rev-parse --abbrev-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}"$(has_changes))"
}

# Show if there are outstanding changes
function has_changes {
  if [ $(git status -s 2> /dev/null | wc -l 2> /dev/null) -gt 0 ]; then
    echo "*";
  fi
}

GREY='\[\033[01;00m\]'
GREEN='\[\033[01;32m\]'
YELLOW='\[\033[01;33m\]'
BLUE='\[\033[01;34m\]'

PS1="${debian_chroot:+($debian_chroot)}$GREEN\u@\h$BLUE \w $YELLOW\$(parse_git_branch)$BLUE\$ $GREY"

if [ -f ~/.bashlocal ]; then
  source ~/.bashlocal;
fi

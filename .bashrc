export PATH=$PATH:/home/rob/bin

# Aliases
alias g='git'
__git_complete g _git
alias gch='git checkout'
__git_complete gch _git_checkout
alias gco='git commit -a'
alias gph='git push'
alias gpt='git push --tags'
alias gpl='git pull'
alias gb='git branch'
alias gst='git status'
alias gft='git fetch --tags'
alias gt='git tag'
alias gm='git merge'
alias gcp='git cherry-pick'
alias gd='git diff'
alias ga='git add'
alias v='gvim'
alias py='python'
alias ls='ls --color=auto'
alias sr='screen -R'
alias curl='curl -w "\n"'

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

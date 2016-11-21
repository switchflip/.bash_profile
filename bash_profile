PATH="/usr:bin:/usr/local/bin:/usr/local/sbin:$PATH" # if not already present
 
export PATH=/usr/local/bin/psql:$PATH
 
PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 20 ]; then CurDir=${DIR:0:5}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'
#PS1="[\$CurDir] \$ "
 
function color_my_prompt {
  local __user_and_host="\[\033[01;32m\]\u@\h"
  local __cur_location="\[\033[01;34m\]\w"
  local __git_branch_color="\[\033[31m\]"
  #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
  local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
  local __prompt_tail="\[\033[35m\]$"
  local __last_color="\[\033[00m\]"
  export PS1="[\$CurDir] $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt
 

# open a new tab on Terminal with the current working dir
function newtab {
  osascript -e "
    tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down
    tell application \"Terminal\" to do script \"cd \\\"$(PWD)\\\"\" in selected tab of the front window
  " > /dev/null 2>&1
} 

 
# List all files
alias desktop="cd ~/Desktop"
alias c="clear"
alias l="ls -la -G"
alias ls="ls -G"
 
alias path='pwd'
alias rm='rm -rf'
 
#git related 
alias gs='git status'
alias ga='git add .'
alias gc='git commit'
alias gco='git checkout'
alias gpl='git pull'
alias gph='git push'
 
alias gl='git log'
alias glp='git log --pretty=format:"%h - %an, %ar : %s"'
alias glg='git log --pretty=format:"%h %s" --graph'
 
 
#Colors
export CLICOLOR=1
export LSCOLORS='Bxgxfxfxcxdxdxhbadbxbx'
 
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

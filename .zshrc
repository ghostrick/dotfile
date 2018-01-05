#
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#


# 開いたとき最大化
echo '\e[9;1t'

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# alias

alias v='vim'
alias vi='vim'
alias vz='vim ~/.zshrc'
alias gig='git log --graph'

# Customize to your needs...
function take (){
  mkdir $1
  cd $1
}

function today (){
    git log --numstat --pretty="%H"  --no-merges --after='24 hour ago'  | awk 'NF==3 {plus+=$1; minus+=$2} END {printf("%d\n", plus)}'
}

function ins (){
    if [ x"$1" = x"-edit" ]; then
        vim ~/dev/php/ig-api/Leafiagram/index.php
    else
        php ~/dev/php/ig-api/Leafiagram/index.php
    fi
}

function insfood (){
    if [ x"$1" = x"-edit" ]; then
        vim ~/dev/php/ig-api/Leafiagram/food/index.php
    else
        php ~/dev/php/ig-api/Leafiagram/food/index.php
    fi
}


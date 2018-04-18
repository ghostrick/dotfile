#
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
export ANDROID_HOME=/usr/local/share/android-sdk
export PATH="$PATH:/Applications/Genymotion.app/Contents/MacOS/tools/"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.anyenv/bin:$PATH"

eval "$(anyenv init -)"
eval "$(rbenv init -)"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# curl等でurlをクォートで囲わなくても使える
setopt nonomatch

# alias
alias psgr='postgres -D /usr/local/var/postgres'
alias open='noglob open'

## nim
alias nimrun='nim compile --run'

## vim
alias v='vim'
alias vi='vim'
alias vz='vim ~/.zshrc'
alias gig='git log --graph'
alias idea='(){
    if [ "$1" = "add" ]; then
        echo $2 >> ~/Documents/idealist.txt
    elif [ "$1" = "show" ]; then
        vim ~/Documents/idealist.txt
    else
        echo "Unknown option"
    fi
}'

# Customize to your needs...
function take (){
    mkdir $1
    cd $1
}

function today (){
    git log --numstat --pretty="%H"  --no-merges --after='24 hour ago'  | awk 'NF==3 {plus+=$1; minus+=$2} END {printf("%d\n", plus)}'
}

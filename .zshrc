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
export PATH="/usr/local/Cellar/openssl/1.0.2o_2/include:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

eval "$(anyenv init -)"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# ssh-add
ssh-add /Users/ishizakatomoya/.ssh/id_rsa_github >&/dev/null

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
alias idea='(){
  if [ "$1" = "add" ]; then
    echo $2 >> ~/Documents/idealist.txt
  elif [ "$1" = "show" ]; then
    cat ~/Documents/idealist.txt
  elif [ "$1" = "edit" ]; then
    vim ~/Documents/idealist.txt
  else
    echo "Unknown option"
  fi
}'

# git alias
alias gig='git log --graph'

function gen_lower_uuid() {
  uuidgen | tr [:upper:] [:lower:]
}

function gic() {
  git add .
  git commit -m "$1"
}

function take (){
  mkdir $1
  cd $1
}

function today (){
  git log --numstat --pretty="%H"  --no-merges --after='24 hour ago'  | awk 'NF==3 {plus+=$1; minus+=$2} END {printf("%d\n", plus)}'
}

# added by travis gem
[ -f /Users/ishizakatomoya/.travis/travis.sh ] && source /Users/ishizakatomoya/.travis/travis.sh

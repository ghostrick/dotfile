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

function lg_edit_pull_request (){
    template_dir="${HOME}/dev/pull_request_template"
    branch_name=$(git rev-parse --abbrev-ref HEAD)
    template_base_path=$(echo "${template_dir}/base.md")
    dir=$(echo "${template_dir}/${branch_name}")
    put_path=$(echo "${dir}/template.md")


    mkdir -p $dir
    if [ ! -f $put_path ]; then
        last_commit_name=$(git log --pretty=format:"%s" | head -n1)
        echo "[${branch_name}] ${last_commit_name}" > $put_path
        echo "" >> $put_path
        echo "https://lovegraph.atlassian.net/browse/${branch_name}" >> $put_path
        echo "" >> $put_path
    fi

    vim $put_path  # use your favorite editor!
}

function lg_send_pull_request (){
  base_branch=$1
  template_dir="${HOME}/dev/pull_request_template"
  branch_name=$(git rev-parse --abbrev-ref HEAD)
  template_path=$(echo "${template_dir}/${branch_name}/template.md")

  echo "git push"
  git push --set-upstream origin $branch_name

  echo "hub pull-request -F $template_path -b $base_branch"
  hub pull-request -F $template_path -b $base_branch
}

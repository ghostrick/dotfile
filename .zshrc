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

function goall-www-deploy (){
    webpack && gulp clean && gulp distCopy && mv ./node_modules ./.node_modules && aws deploy push --region ap-northeast-1 --application-name goall-www --s3-location s3://ods-deploy-s3-bucket/staging/GL-WWW-STAGING-DEPLOY-$RANDOM.zip --source ../ --ignore-hidden-file && mv ./.node_modules ./node_modules
}

function goall-www-deploy-prod (){
    webpack && gulp clean && gulp distCopy && mv ./node_modules ./.node_modules && aws deploy push --region ap-northeast-1 --application-name goall-www --s3-location s3://ods-deploy-s3-bucket/product/GL-WWW-PRODUCT-DEPLOY-$RANDOM.zip --source ../ --ignore-hidden-file && mv ./.node_modules ./node_modules
}

function goall-api-deploy (){
    aws deploy push --region ap-northeast-1 --application-name goall-server --s3-location s3://ods-deploy-s3-bucket/staging/GL-SERVER-STAGING-DEPLOY-$RANDOM.zip --source ./ --ignore-hidden-file
}

function goall-api-deploy-prod (){
    aws deploy push --region ap-northeast-1 --application-name goall-server --s3-location s3://ods-deploy-s3-bucket/product/GL-SERVER-PRODUCT-DEPLOY-$RANDOM.zip --source ./ --ignore-hidden-file
}

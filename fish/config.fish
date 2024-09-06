# Ubuntu: ~/.config/fish/conf.d/config.fish
# Install theme
# * ln -s ./theme/fish_prompt.fish ~/.config/fish/functions/
# * ln -s ./theme/fish_right_prompt.fish ~/.config/fish/functions/


alias vim='nvim' 
alias vi='nvim' 
alias v='nvim'
alias g='git'
alias gig='git log --graph'
alias psgr='/etc/init.d/postgresql'

function take --description "take <dirname>"
  mkdir -p $argv[1]
  cd $argv[1]
end

if test -d $HOME/chromedriver
  set PATH $HOME/chromedriver $PATH
end

if test -d $HOME/Android/Sdk
  set ANDROID_HOME $HOME/Android/Sdk 
  set PATH $ANDROID_HOME/tools $PATH
  set PATH $ANDROID_HOME/platform-tools $PATH
end

if test -d /opt/elixir/bin
  set PATH /opt/elixir/bin $PATH
end

if test -d /opt/android-studio/bin
  set PATH /opt/android-studio/bin/ $PATH
end

if test -d $HOME/flutter
  set PATH $HOME/flutter/bin $PATH
end

if test -d /usr/local/cuda/bin
  set PATH /usr/local/cuda/bin $PATH
  set LD_LIBRARY_PATH /usr/local/cuda/lib64 $LD_LIBRARY_PATH
end

if test -d $HOME/.ebcli-virtual-env/executables
  set PATH $HOME/.ebcli-virtual-env/executables $PATH
end

if test /usr/lib/go-1.21/bin
  set PATH /usr/lib/go-1.21/bin $PATH
end

if test -d $HOME/go
  set GOPATH $HOME/go
  set PATH $GOPATH/bin $PATH
end

if test -d $HOME/.local/share/solana/install/active_release/bin
  set PATH $HOME/.local/share/solana/install/active_release/bin $PATH
end


source ~/.asdf/asdf.fish
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache

if test -z $TMUX
  tmux new-session
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ghostrick/google-cloud-sdk/path.fish.inc' ]; . '/home/ghostrick/google-cloud-sdk/path.fish.inc'; end

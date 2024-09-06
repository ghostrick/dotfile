# Dotfile

## Setup
```
$ ln -s /path/to/dotfile/tmux/.tmux.conf ~/.tmux.conf

$ ln -s /path/to/dotfile/fish/config.fish ~/.config/fish/conf.d/config.fish 
$ fisher install /path/to/dotfile/fish/theme

$ mkdir -p ~/.config/alacritty/themes
$ git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
$ ln -s /path/to/dotfile/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

$ ln -s /path/to/dotfile/nvim/init.vim ~/.config/nvim/init.vim
$ ln -s /path/to/dotfile/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
```

## coc.nvim
```
CocInstall coc-angular
CocInstall coc-html
CocInstall coc-css
CocInstall coc-elixir
CocInstall coc-tsserver
CocInstall coc-flutter
```

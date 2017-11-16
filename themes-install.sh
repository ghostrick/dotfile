set -eu
THEMES_DIR="$HOME/.zprezto/modules/prompt"
EXTERNAL_DIR="${THEMES_DIR}/external"
FUNCTIONS_DIR="${THEMES_DIR}/functions"

cd $EXTERNAL_DIR
git clone https://github.com/Ghostrick/leafia-prompt
ln -s $EXTERNAL_DIR/leafia-prompt/leafia.zsh $FUNCTIONS_DIR/prompt_leafia_setup
cd -

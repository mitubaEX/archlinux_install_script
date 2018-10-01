chsh -s /usr/bin/zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

export PYTHONPATH=python3:pip3
pip3 install neovim
nvim -e -c "call dein#install()"
nvim -e -c "UpdateRemotePlugins"

# git
git config --global core.editor 'nvim -c "set fenc=utf-8"'
git config --global user.name "mitubaEX"
git config --global user.email "g1344955@cse.kyoto-su.ac.jp"

# powerline fonts
# clone
cd $HOME
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf

# neovim-remote
pip3 install neovim-remote

# install gocode
go get -u github.com/mdempsky/gocode

# haskell
stack setup

# vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ./installer.sh
sh ./installer.sh ~/.cache/dein/. ; rm ./installer.sh

# arch linux
if [ "$(uname)" = "Linux" ]; then
  git config --global credential.helper /usr/lib/git-core/git-credential-gnome-keyring
fi

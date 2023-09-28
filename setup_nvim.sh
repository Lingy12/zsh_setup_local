curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

mv nvim.appimage $HOME/bin/nvim

mkdir $HOME/.config/nvim

# download node for local
wget https://nodejs.org/dist/v18.17.1/node-v18.17.1-linux-x64.tar.xz
tar xvf node-v18.17.1-linux-x64.tar.xz
mv node-v18.17.1-linux-x64 $HOME/bin/node
echo "export PATH=$HOME/bin/node/bin:$HOME/bin:$PATH" >> ~/.zshrc

git clone https://gitlab.com/Lin_GY/my_nvim.git
cp -r my_nvim/* $HOME/.config/nvim/

rm -rf my_nvim node*

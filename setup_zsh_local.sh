# install on linux
cur_dir=$PWD
wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1
cd zsh

./configure --prefix=$HOME
make
make install
rm -rf zsh.tar zsh zsh.tar.xz

cd $cur_dir

export PATH=$HOME/bin/:$PATH
# exec $HOME/bin/zsh -l 

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo '[ -f $HOME/bin/zsh ] && exec $HOME/bin/zsh -l' >> ~/.profile

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp ./zshrc_template ~/.zshrc

source ~/.zshrc

exec $HOME/bin/zsh -l



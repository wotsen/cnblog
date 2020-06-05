# 安装软件
echo "安装软件"
#sudo apt-get install ctags git zsh tree python3 vim vim vim-gnome vim-scripts vim-doc xclip astyle python-setuptools python-dev gcc clang build-essential cmake zip
#sudo easy_install -ZU autopep8
#sudo apt-get install nodejs npm

mv -f ~/.vim ~/.vim_old
mv -f ~/.vimrc ~/.vimrc_old
mv -f ~/.bashrc ~/.bashrc_old

printf "\033[33mChecking Dir\033[0m\n"

cp -rf .vim ~/
cp -rf .vimrc ~/
cp -rf .conf ~/
unzip ~/.vim/plugged/taghighlight-automirror.zip -d ~/.vim/plugged/

vim -c "PlugInstall" -c "q" -c "q"

echo "如果安装YouCompleteMe卡住了请中断手动安装:cd ~/.vim/plugged/YouCompleteMe && git submodule update --init --recursive"

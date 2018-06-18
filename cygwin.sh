# Fix the git problem
mv /cygdrive/c/cygwin64/bin/git.exe /cygdrive/c/cygwin64/bin/git.exe.bak

# Configure development environment
# shell environment...
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
cd ~
git clone https://github.com/rupa/z
# .dotfiles
git clone --recursive https://github.com/grapeot/.dotfiles
# .tmux.conf
ln -s .dotfiles/.tmux.conf .tmux.conf
cat .tmux.conf | grep -v 'powerline' | tee .tmux.conf  # Windows cannot use powerline?
# git configuration
git config --global user.name "canftin"
git config --global user.email wwc7033@gmail.com
git config --global color.ui auto
# ssh configuration (won't take effect until restart)
cat /etc/sshd_config | sed 's/Port 22/Port 30/' | tee /etc/ssh/sshd_config 
ssh-host-config

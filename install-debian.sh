sudo apt-get install vim
echo 'export EDITOR=vim' >> ~/.bashrc

# setup git
git config --global user.email christophe.meyer.pro@gmail.com
git config --global user.name Christophe Meyer
git config --global credential.helper cache

# install docker
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker pi

# install pyenv
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
echo '
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
' >> ~/.bashrc

# install python (deps)
sudo apt-get install libbz2-dev libssl-dev libsqlite3-dev
pyenv install 3.6.3


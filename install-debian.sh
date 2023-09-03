sudo apt update
sudo apt upgrade
sudo apt install  cmake fd-find fzf git git-lfs grip htop i3 mupdf ranger ripgrep stow tmux tree vlc vim wget

# Vim folders
mkdir -p ~/.vim/
mkdir -p ~/.vim/files/backup/
mkdir -p ~/.vim/files/swap/
mkdir -p ~/.vim/files/undo/
mkdir -p ~/.vim/files/info/
mkdir -p ~/.vim/autoload

# Install (sym)links
stow bin vim python julia tmux --target=$HOME

# Vim setup
vim -c PlugInstall  # Install vim plugins (configured in vimrc)
echo 'export EDITOR=vim' >> ~/.bashrc

# setup git
git config --global user.email christophe.meyer.pro@gmail.com
git config --global user.name Christophe Meyer
git config --global credential.helper cache  # keep in memory for a few minutes
git config --global push.default current  # auto set upstream when pushing a new branch

# install docker
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker $USER

# install pyenv
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
echo '
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
' >> ~/.bashrc

# install python (deps)
sudo apt-get install libbz2-dev libssl-dev libsqlite3-dev
pyenv install 3.10.8

mkdir ~/bin
export PATH="~/bin:$PATH"

# julialang
curl -fsSL https://install.julialang.org | sh
juliaup add 1.9
juliaup default 1.9

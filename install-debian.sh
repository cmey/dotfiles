sudo apt-get install  cmake fzf git git-lfs grip htop ripgrep stow tmux tree vlc vim wget

# Vim folders
mkdir -p ~/.vim/
mkdir -p ~/.vim/files/backup/
mkdir -p ~/.vim/files/swap/
mkdir -p ~/.vim/files/undo/
mkdir -p ~/.vim/files/info/
mkdir -p ~/.vim/autoload

# Install (sym)links
stow vim python julia tmux --target=$HOME

# Vim setup
vim -c PlugInstall  # Install vim plugins (configured in vimrc)
echo 'export EDITOR=vim' >> ~/.bashrc

# - When the shell exits, append to the history file instead of overwriting it.
shopt -s histappend

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
pyenv install 3.9.1

mkdir ~/bin
export PATH="~/bin:$PATH"

# julialang
julia_archive_file=julia-1.7.2-linux-x86_64.tar.gz
wget https://julialang-s3.julialang.org/bin/linux/x64/1.7/$julia_archive_file
tar -xzvf $julia_archive_file
ln -s ~/Downloads/julia-1.7.2/bin/julia ~/bin/

# install heroku CLI (adds ppa, update with apt-get)
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

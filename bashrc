# BASH ALIASES
alias ls="ls -aGh"  # F adds symbols at end of non simple files
alias ll="ls -l"
alias dir="ls"
alias dor="dir"
alias dockerenv='eval $(docker-machine env default)'
alias emacs='open -a /Applications/Emacs.app $1'
alias find='gfind'  # find . ! -readable -prune -name anaconda
alias k='kill %%'
alias t='py.test --fast --automated -n auto'
alias g='googler -t y1 --lucky'  # time 1 year, open first hit

alias pos='source ~/bin/env-poseidon-Butterfly.sh'
alias pos='eval "$(pyenv init -)"; eval "$(pyenv virtualenv-init -)"'
alias py="source ~/bin/env-pyenv-standalone.sh"
alias i="cd /Users/cmey/Code/GitHub/ButterflyNetwork/poseidon/imaging/imaging; pos"
alias ipy="ipython notebook"
alias ipy2="ipython2 notebook"
alias ipy3="ipython3 notebook"
alias cleanpyc="find . -iname '*.pyc' -exec rm -rf {} \;"

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="~/bin:$PATH"
export PATH="~/Downloads/gcutil-1.8.3:~/Downloads/gsutil:$PATH"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export DYLD_LIBRARY_PATH=.
export LD_LIBRARY_PATH=/usr/local/lib:/opt/X11/lib:$LD_LIBRARY_PATH

# OPENCL
export PYOPENCL_CTX=':2' # [2] <pyopencl.Device 'GeForce GT 750M' on 'Apple' at 0x1022700>

# PYTHON
export PYTHONPATH="/usr/local/lib/python2.7:$PYTHONPATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export EDITOR=vim

# JULIA
#export PATH="$JULIAPATH/bin:$PATH"
#export JULIADIR="/Applications/Julia-0.3.11.app/Contents/MacOS"
#JULIAPATH='/Applications/Julia-0.3.7.app/Contents/Resources/julia'
#alias julia=${JULIADIR}/Julia
#alias Julia=julia
# Escher
export PATH=~/.julia/v0.4/Escher/bin:$PATH


# BREW QT5
#If you build your own software and it requires this formula, you'll need to add to your
#build variables:
#export LDFLAGS=-L/usr/local/opt/qt5/lib
#export CPPFLAGS=-I/usr/local/opt/qt5/include

# QWT
export QWT_ROOTDIR=/usr/local/qwt-6.1.2
#export QWT_ROOTDIR=/usr/local/Cellar/qwt/6.1.2 # from homebrew

# MATLAB
export PATH=$PATH:/Applications/MATLAB_R2015a.app/bin

# CUDA
export PATH=/Developer/NVIDIA/CUDA-7.0/bin:$PATH
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-7.0/lib:$DYLD_LIBRARY_PATH

# ARRAYFIRE
export DYLD_LIBRARY_PATH=/usr/local/Cellar/arrayfire/3.0.0/lib/:$DYLD_LIBRARY_PATH
export AF_CUDA_DEFAULT_DEVICE=0
export AF_OPENCL_DEFAULT_DEVICE=1
export AF_DISABLE_GRAPHICS=1
export PYTHONPATH=/Users/cmey/Code/GitHub/arrayfire-python:$PYTHONPATH

# AWS bash completion
complete -C aws_completer aws


# BASH HISTORY
# Increase history size.
export HISTFILESIZE=10000000
# Avoid duplicates.
export HISTCONTROL=ignoredups:erasedups
# Merged BASH HISTORY for multiple terminals.
# - When the shell exits, append to the history file instead of overwriting it.
shopt -s histappend
# - After each command, append to the history file and reread it.
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

#
# Git
#
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PROMPT_THEME=Solarized
source `brew --prefix`/etc/bash_completion.d/git-completion.bash
source `brew --prefix`/etc/bash_completion.d/git-prompt.sh
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

if type __git_ps1 &>/dev/null; then
    export PS1="\h:\W\$(__git_ps1) $ "
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Colors
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1

# FISH SHELL, see config in TODO: find config file name
#fish

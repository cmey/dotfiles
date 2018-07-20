# BEGIN fbf033cf-0bd8-4b62-bf8a-1a490c72108f
export PATH=~/.rbenv/bin:$PATH
eval "$(rbenv init -)"
# END fbf033cf-0bd8-4b62-bf8a-1a490c72108f
# BEGIN 0120fc47-8faa-46bd-99ab-da05b504858e
export PATH=$PATH:"/opt/cypress/yagarto-4.7.2/bin"
export ARMGCC_INSTALL_PATH="/opt/cypress/yagarto-4.7.2"
export ARMGCC_VERSION="4.7.2"
export FX3_INSTALL_PATH="/opt/cypress/cyfx3sdk"
# END 0120fc47-8faa-46bd-99ab-da05b504858e

export EDITOR=vim

# tell fzf to use ripgrep
export FZF_DEFAULT_COMMAND="rg --files --hidden --smart-case --glob '!.git/*'"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# BASH ALIASES
alias reqs="find . -name '*requirement*'"
#alias ls="ls -aGh"  # F adds symbols at end of non simple files
alias ll="ls -l"
alias dir="ls"
alias dor="dir"
alias dockerenv='eval $(docker-machine env default)'
alias find='gfind -L'
alias f='find . -iname'
alias got='git'
alias grip='grip -b'  # markdown preview
alias htop='glances'  # htop doesn't support macOS High Sierra
alias j='$(pyenv which jupyter) notebook'
alias ju="julia -e 'using IJulia; IJulia.notebook()'"
alias k='kill %%'
alias t='py.test --fast --automated -n auto'
alias g='googler -t y1 --lucky'  # time 1 year, open first hit
alias orig="find . -name '*orig*'"
alias p='git pullall'
alias pos='source ~/bin/env-butterfly.sh'
alias py="source ~/bin/env-pyenv-standalone.sh"
alias spell='python $BNI_DEV_ROOT/Build/StaticCheck/bniSpell/bniSpellCheck.py'
alias helios='open $BNI_DEV_ROOT/Applications/HeliosNativeIos/Helios.xcworkspace'
alias i="cd /Users/cmey/Code/GitHub/ButterflyNetwork/poseidon/software/imaging/imaging; pos"
alias ipy="ipython notebook"
alias ipy2="ipython2 notebook"
alias ipy3="ipython3 notebook"
alias cleanpyc="find . -iname '*.pyc' -exec rm -rf {} \;"
alias vimup="vim +PlugUpgrade +PlugUpdate +qall"
alias julia="julia --quiet"  # Suppress startup banner

# MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export PATH=~/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/lib:/opt/X11/lib:$LD_LIBRARY_PATH

# OPENCL
# export PYOPENCL_CTX=':2' # [2] <pyopencl.Device 'GeForce GT 750M' on 'Apple' at 0x1022700>

# PYTHON
export PYTHONSTARTUP=~/.pythonrc.py
# See also pyenv below

# JULIA
export JULIAPATH=/Applications/Julia-0.6.app/Contents/Resources/julia/bin
export PATH=$JULIAPATH:$PATH
# Escher
export PATH=~/.julia/v0.6/Escher/bin:$PATH
# Parallelization with: Threads.@threads for i = 1:length(...)
export JULIA_NUM_THREADS=4

# BREW QT5
#If you build your own software and it requires this formula, you'll need to add to your
#build variables:
#export LDFLAGS=-L/usr/local/opt/qt5/lib
#export CPPFLAGS=-I/usr/local/opt/qt5/include

# QWT
#export QWT_ROOTDIR=/usr/local/qwt-6.1.2
#export QWT_ROOTDIR=/usr/local/Cellar/qwt/6.1.2 # from homebrew

# ARRAYFIRE
# export AF_CUDA_DEFAULT_DEVICE=0
# export AF_OPENCL_DEFAULT_DEVICE=1
# export AF_DISABLE_GRAPHICS=1
# export DYLD_LIBRARY_PATH=/usr/local/Cellar/arrayfire/3.0.0/lib/:$DYLD_LIBRARY_PATH
# export PYTHONPATH=/Users/cmey/Code/GitHub/arrayfire-python:$PYTHONPATH

# BASH HISTORY
# Displayed format.
export HISTTIMEFORMAT="%d/%m/%y %T "
# Increase history size.
export HISTSIZE=1000000
export HISTFILESIZE=1000000
# Avoid duplicates.
export HISTCONTROL=ignoredups:erasedups
# Merged BASH HISTORY for multiple terminals.
# - When the shell exits, append to the history file instead of overwriting it.
shopt -s histappend
# - After each command, append to the history file and reread it.
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# BASH Colors
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'

# GIT
# git mergetool --tool=p4merge
# Setting the mergetool.keepBackup configuration variable to false
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=  # true
export GIT_PS1_SHOWUNTRACKEDFILES=  # true
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
if [ -f /usr/local/share/gitprompt.sh ]; then
    export GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
    export GIT_PROMPT_ONLY_IN_REPO=1
    export GIT_PROMPT_FETCH_REMOTE_STATUS=0  # uncomment to avoid fetching remote status
    export GIT_PROMPT_SHOW_UNTRACKED_FILES=no  # can be no, normal or all; determines counting of untracked files
    export GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files
    . /usr/local/share/gitprompt.sh
fi

if type __git_ps1 &>/dev/null; then
    export PS1="\h:\W\$(__git_ps1) $ "
fi

if [ -f ~/Code/dotfiles/homebrew-token-export.sh ]; then
    source ~/Code/dotfiles/homebrew-token-export.sh
fi

# TEX
export PATH=/usr/local/opt/texinfo/bin:$PATH

# THEFUCK correct mistyped console commands
eval $(thefuck --alias)

# FISH SHELL, see config in TODO: find config file name
#fish

# BEGIN 1cff6a31-bb8f-4879-a2b4-8a6b3a7e8ed4
if [ -z "$PYENV_ROOT" ]; then
  export PYENV_ROOT="${HOME}/.pyenv"
fi
export PATH="$PYENV_ROOT/bin:$PATH"
if [ -x ~/.pyenv/bin/pyenv ]; then
  eval "$(~/.pyenv/bin/pyenv init -)"
  eval "$(~/.pyenv/bin/pyenv virtualenv-init -)"
fi
# END 1cff6a31-bb8f-4879-a2b4-8a6b3a7e8ed4
# BEGIN d211d168-c177-41b2-812e-0a0dff6475a0
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# END d211d168-c177-41b2-812e-0a0dff6475a0
# BEGIN 77afbd10-e4d8-45ac-9877-9767f81c3bc0
export BNI_QT_DIR="/Users/cmey/Qt/5.6.3"
# END 77afbd10-e4d8-45ac-9877-9767f81c3bc0
# BEGIN 9ff6e834-e8ac-4454-95a9-a6d3e2308296
export BNI_LIBS_ROOT="/Users/cmey/software-libs"
# END 9ff6e834-e8ac-4454-95a9-a6d3e2308296
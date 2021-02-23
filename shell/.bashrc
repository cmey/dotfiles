# BEGIN 57b557ba-d370-4940-8b71-bcba0ffcc5d4
if [ -z "$PYENV_ROOT" ]; then
  export PYENV_ROOT="${HOME}/.pyenv"
fi
export PATH="$PYENV_ROOT/bin:$PATH"
if [ -x ~/.pyenv/bin/pyenv ]; then
  eval "$(~/.pyenv/bin/pyenv init -)"
  eval "$(~/.pyenv/bin/pyenv virtualenv-init -)"
fi
# END 57b557ba-d370-4940-8b71-bcba0ffcc5d4
# BEGIN 462a054b-5f86-4159-9d0f-fb35dc983593
export BASH_SILENCE_DEPRECATION_WARNING=1
# END 462a054b-5f86-4159-9d0f-fb35dc983593
# BEGIN 77afbd10-e4d8-45ac-9877-9767f81c3bc0
export BNI_QT_DIR="/Users/cmeyer/Qt/5.12.6"
# END 77afbd10-e4d8-45ac-9877-9767f81c3bc0
# Load config that is common (across shells)
source ~/rc

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

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# # BASH HISTORY
# # Displayed format.
# export HISTTIMEFORMAT="%d/%m/%y %T "
# # Increase history size.
# export HISTSIZE=1000000
# export HISTFILESIZE=1000000
# # Avoid duplicates.
# export HISTCONTROL=ignoredups:erasedups
# # Merged BASH HISTORY for multiple terminals.

# - When the shell exits, append to the history file instead of overwriting it.
shopt -s histappend

# # - After each command, append to the history file and reread it.
# export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# BASH Colors
# export CLICOLOR=1
# export GREP_OPTIONS='--color=auto'

# # GIT
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=  # true
export GIT_PS1_SHOWUNTRACKEDFILES=  # true
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
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

# HOMEBREW configure Completions
# This function checks whether we have a given program on the system.
# No need for bulky functions in memory if we don't.
#
#have()
#{
#    unset -v have
#    # Completions for system administrator commands are installed as well in
#    # case completion is attempted via `sudo command ...'.
#    PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin type $1 &>/dev/null &&
#    have="yes"
#}
##export -f function_name

#if type brew 2&>/dev/null; then
#  for completion_file in $(brew --prefix)/etc/bash_completion.d/*; do
#    echo "$completion_file"
#    source "$completion_file"
#  done
#fi

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
# BEGIN d63f2871-965d-4a42-9576-d33f3a08434c
export ANDROID_HOME="/opt/android-sdk"
export ANDROID_NDK_HOME="/opt/android-ndk/android-ndk-r17b"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home"
export PATH="/opt/android-sdk/tools/bin:/opt/android-sdk/platform-tools:$PATH"
# END d63f2871-965d-4a42-9576-d33f3a08434c
# BEGIN 1a3c0481-3aac-4d69-a495-9dfbbe3ccf48
export BNI_DEV_ROOT=/Users/cmeyer/Code/ButterflyNetwork/software/dev-ops/../host
export BNI_BUILD=$BNI_DEV_ROOT/Build
export PYTHONPATH=/Users/cmeyer/Code/ButterflyNetwork/software/dev-ops/../bazel-bin/host/Applications/BniHardwareWrapper
# END 1a3c0481-3aac-4d69-a495-9dfbbe3ccf48

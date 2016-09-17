alias dir='ls'
alias dockerenv='eval $(docker-machine env default)'
alias emacs='open -a /Applications/Emacs.app $1'
alias find='gfind'  # find . ! -readable -prune -name anaconda
alias k='kill %'
alias ll='ls -l'
alias ls='ls -a'
alias pos='eval "$(pyenv init -)"; eval "$(pyenv virtualenv-init -)"'

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="~/bin:$PATH"

export PATH="~/Downloads/gcutil-1.8.3:~/Downloads/gsutil:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export LD_LIBRARY_PATH=/usr/local/lib:/opt/X11/lib:$LD_LIBRARY_PATH

export EDITOR=vim

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#JULIAPATH='/Applications/Julia-0.3.7.app/Contents/Resources/julia'
#export PATH="$JULIAPATH/bin:$PATH"

export PYTHONPATH="/usr/local/lib/python2.7:$PYTHONPATH"

export PS1='\u:\W\$ '

# Colors
export GREP_OPTIONS='--color=auto'

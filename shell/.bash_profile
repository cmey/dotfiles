# Bash loads .bash_profile for login shells (and in Mac OS X in terminal emulators like Termminal.app or iTerm2) and .bashrc for interactive shells (default mode in most of the GNU/Linux terminal emulators). A good "practice" is sourcing .bashrc into .bash_profile to keep things working in all the scenarios.

# Sourcing bashrc starts to be slow. We don't need to source twice. Comment the following.



test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
# BEGIN source-bashrc
source ~/.bashrc
# END source-bashrc

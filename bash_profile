# Bash loads .bash_profile for login shells (and in Mac OS X in terminal emulators like Termminal.app or iTerm2) and .bashrc for interactive shells (default mode in most of the GNU/Linux terminal emulators). A good "practice" is sourcing .bashrc into .bash_profile to keep things working in all the scenarios.

# Sourcing bashrc starts to be slow. We don't need to source twice. Comment the following.

# BEGIN 8841bf92-478f-48e0-aaee-94752af0b880
source ~/.bashrc
# END 8841bf92-478f-48e0-aaee-94752af0b880

# BEGIN b0f03bf4-ba27-4d31-a681-949c39de9b64
# source ~/.bashrc
# END b0f03bf4-ba27-4d31-a681-949c39de9b64

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

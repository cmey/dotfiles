# Bash loads .bash_profile for login shells (and in Mac OS X in terminal emulators like Termminal.app or iTerm2) and .bashrc for interactive shells (default mode in most of the GNU/Linux terminal emulators). A good "practice" is sourcing .bashrc into .bash_profile to keep things working in all the scenarios.
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

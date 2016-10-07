# ----------------------------------------------------------------
# Colorization and Reporting
# ----------------------------------------------------------------

# For echo
BLACK="\033[1;90m"
RED="\033[1;91m"
GREEN="\033[1;92m"
YELLOW="\033[1;93m"
BLUE="\033[1;94m"
MAGENTA="\033[1;95m"
CYAN="\033[1;96m"
WHITE="\033[1;97m"
C_RESET="\033[0;99m"
NORMAL="\033[m"

# For PS
PS_BLACK="\[\e[1;90m\]"
PS_RED="\[\e[1;91m\]"
PS_GREEN="\[\e[1;92m\]"
PS_YELLOW="\[\e[1;93m\]"
PS_BLUE="\[\e[1;94m\]"
PS_MAGENTA="\[\e[1;95m\]"
PS_CYAN="\[\e[1;96m\]"
PS_WHITE="\[\e[1;97m\]"
PS_C_RESET="\[\e[0;99m\]"
PS_NORMAL="\[\e[m\]"

# Report a setup step to the user.  If a second argument is supplied,
# use the color with the given name (all caps, afrom one of the above
# colors).
function report ()
{
    msg=">>>>>>>> $1"
    if [ -n "$2" ]; then
        eval color="\$$2"
        echo -e ${color}${msg}${NORMAL}
    else
        echo "${msg}"
    fi
}

# ----------------------------------------------------------------
# RC Script Setup
# ----------------------------------------------------------------

function check_rc() {
    # Validate .rc setup

    # Best practice is to put all setup in ~/.bashrc and source it
    # from ~/.profile.  Use of ~/.bash_profile is discouraged.

    for RC_SCRIPT in ~/.bashrc ~/.zshrc; do
        if ! grep 'source .*set_env.sh' $RC_SCRIPT &> /dev/null; then
            env_script="$POS_ROOT/set_env.sh"
            report "Adding \"source $env_script\" to $RC_SCRIPT" CYAN
            echo "if [ -f \"$env_script\" ]; then source $env_script; fi" >> $RC_SCRIPT
            MODIFIED_WARNING=1
        fi
    done

    if ! grep 'source ~/.bashrc' ~/.profile &> /dev/null; then
        report 'Adding "source ~/.bashrc" to ~/.profile' CYAN
        echo "if [ -f ~/.bashrc ]; then source ~/.bashrc; fi" >> ~/.profile
        MODIFIED_WARNING=1
    fi

    if [ -f .bash_profile ] && ! grep 'source ~/.profile'; then
        report 'Adding "source ~/.profile" to ~/.bash_profile' CYAN
        report 'Prefer using .profile instead of .bash_profile' RED
        echo "if [ -f ~/.profile ]; then source ~/.profile; fi" >> ~/.bash_profile
        MODIFIED_WARNING=1
    fi

    if [ ! -z "$MODIFIED_WARNING" ]; then
        report 'WARNING: Environment variables and bashrc settings may
        have changed.  Start a new shell after configuring before
        doing real work.' RED
    fi
}

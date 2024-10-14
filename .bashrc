#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# ETERNAL HISTORY
export HISTCONTROL=ignoreboth
export HISTSIZE=
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a"
shopt -s histappend


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# DEFAULT ENCODING
export LC_ALL=en_US.UTF-8


# SSH-AGENT SOCKET LOCATION
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"


# Java
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"


# PROMPT CUSTOMIZATION
USER_TXT=$(echo -en "\e[97;48;2;175;95;255m")
IP_TXT=$(echo -en "\e[97;48;2;215;135;0m")
DIR_TXT=$(echo -en "\e[97;48;2;69;132;30m")
INPUT_TXT=$(echo -en "\e[38;5;226m")
TRIANGLE=$'\uE0B0'
TRIANGLE1=$(echo -en "\e[38;2;175;95;255;48;2;69;132;30m")
TRIANGLE2=$(echo -en "\e[38;2;69;132;30m")
PS1=""
PS1+="\[\e[0m\]"  # Clear font color
PS1+="\[${USER_TXT}\]\u@\h"  # Sets id
PS1+="\[\e[0m\]"  # Clears font color
PS1+="\[${TRIANGLE1}\]${TRIANGLE}\[${DIR_TXT}\] \[\e[1;4m\]\w\[\e[22;24m\] \[\e[0m\]"  # Places arrow character and working diretory
PS1+="\[${TRIANGLE2}\]${TRIANGLE} \[\e[0m\]"  # Places arrow character and clears styles
PS2='${INPUT_TXT}> \[\e[0m\]'
UPDATE_TITLE='\033]0;${USER}@${HOSTNAME}: $(pwd | rev | cut -d / -f1-3 | rev)\007'
PROMPT_COMMAND="echo -ne \"$UPDATE_TITLE\"; $PROMPT_COMMAND"

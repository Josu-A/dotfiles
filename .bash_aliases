#
# Bash aliases
#

alias op='xdg-open'

# Make ls display output of lsd instead
alias ls='lsd'

# ls shortcuts, which output from lsd as set in the previous alias
alias l='clear;ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='clear;tree -aC'
alias ltd='clear;tree -aCd'

# Color the output of some commands as default
alias ip='ip -color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# Default style for xterm terminal
alias xterm='xterm -bg black -fg white -fa "Droid Sans Mono" -fs 12'

# Force dark mode, gtk dark theme fix
alias vivaldi-stable='vivaldi-stable --force-dark-mode'

# Shortcuts for executables
alias objectdb-explorer='java -jar /opt/objectdb/bin/explorer.jar'

# VPN connection shortcut
alias ehu-vpn-up='nmcli --ask connection up f6c3cecc-7d0b-4706-b4b2-0bdc00d98e96'
alias ehu-vpn-down='nmcli connection down f6c3cecc-7d0b-4706-b4b2-0bdc00d98e96'

# Generic alias shortcuts
alias am='alsamixer --view=all'

# SSH connection shortcuts
alias ssh-aguijos='ssh -i ~/.ssh/azurekey.pem azureuser@aguijos.eus'

# git shortcut to manage dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

# nvim
alias vim='nvim'
alias vi='nvim'
alias v='nvim'

# bash aliases
alias b-aliases='nvim ~/.bash_aliases'
alias b-rc='nvim ~/.bashrc'
alias b-profile='nvim ~/.bash_profile'

#
# Bash functions
#

cd() {
    builtin cd "$@" && l;
}

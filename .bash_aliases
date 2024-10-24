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
alias ssh-aguijos='ssh -i ~/.ssh/azurekey.pem azureuser@sgssi.aguijos.eus'

# git shortcut to manage dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias dotfiless='dotfiles status'
alias dotfilesa='dotfiles add -u'
alias dotfilesc='dotfiles commit -m'
alias dotfilesp='dotfiles push'

# git shortcuts to manage etcfiles
alias etcfiles='/usr/bin/git --git-dir=$HOME/.etcfiles --work-tree=/etc'
alias etcfiless='etcfiles status'
alias etcfilesa='etcfiles add -u'
alias etcfilesc='etcfiles commit -m'
alias etcfilesp='etcfiles push'

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

# Show ports in use
ports() {
    spro="TCP"

    cmd="sudo lsof -nP -s${spro}:LISTEN -i${spro}"
    if [[ -n $1 ]]; then
        cmd="${cmd}:$1"
    fi

    eval "$cmd"
}

# Extract archived files
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar -jxvf $1         ;;
            *.tar.xz)    tar -Jxvf $1         ;;
            *.tar.gz)    tar -zxvf $1         ;;
            *.bz2)       bunzip2 $1           ;;
            *.dmg)       hdiutil mount $1     ;;
            *.gz)        gunzip $1            ;;
            *.tar)       tar -xvf $1          ;;
            *.tbz2)      tar -jxvf $1         ;;
            *.tgz)       tar -zxvf $1         ;;
            *.zip)       unzip $1             ;;
            *.ZIP)       unzip $1             ;;
            *.7z)        7z x $1              ;;
            *.rar)       unrar x $1           ;;
            *.Z)         uncompress $1        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# List files after changing directory
cd() {
    builtin cd "$@" && l;
}

# Change directory to the directory lf was at before exiting
lfcd() {
    cd "$(command lf -print-last-dir "$@")"
}


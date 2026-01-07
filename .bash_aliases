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

# Alias rm to suggest using trash instead
alias rm='echo "You might be looking for: trash-put "'
alias tp='trash-put'

# Default style for xterm terminal
alias xterm='xterm -bg black -fg white -fa "Droid Sans Mono" -fs 12'

# Force dark mode, gtk dark theme fix
alias vivaldi-stable='vivaldi-stable --force-dark-mode'

# Shortcuts for executables
alias objectdb-explorer='java -jar /opt/objectdb/bin/explorer.jar'

# Pacman shortcuts
alias pacman-all='LC_ALL=C.UTF-8 pacman -Qi | awk '\''/^Name/{name=$3} /^Installed Size/{print $4$5, name}'\'' | LC_ALL=C.UTF-8 sort -h'

# AUR
alias checkaurupdates='paru -Qua'

# VPN connection shortcut
alias ehu-vpn-up='nmcli --ask connection up f6c3cecc-7d0b-4706-b4b2-0bdc00d98e96'
alias ehu-vpn-down='nmcli connection down f6c3cecc-7d0b-4706-b4b2-0bdc00d98e96'

# Generic alias shortcuts
alias am='alsamixer --view=all'

# SSH connection shortcuts
alias ssh-aguijos='ssh -i ~/.ssh/azurekey.pem azureuser@sgssi.aguijos.eus'
alias ssh-ocloud='TERM=xterm-256color ssh -i ~/.ssh/oracle_cloud_aginagajosu.pem ubuntu@mc.aguijos.eus'
alias ssh-abd='TERM=xterm-256color ssh -i ~/.ssh/ssh-aguinaga-01-key-2025-2026 opc@abd.aguijos.eus'

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

# window manager
alias awesome-config='cd $HOME/.config/awesome && nvim ./rc.lua'

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


# find helpers
find-files() {
    if [[ "$1" == "-h" ]]; then
        echo "Usage: find-files <directory> <search_term>"
        echo "Finds files inside <directory> that contain <search_term> (case-insensitive)."
        echo
        echo "Example: find-files /home/user txt"
        echo "→ Finds files in /home/user with 'txt' in their name."
        return
    fi

    if [[ -z "$1" || -z "$2" ]]; then
        echo "Error: Missing arguments. Use -h for help."
        return 1
    fi

    find "$1" -type f -iname "*$2*" -print0 2>/dev/null | sort -z | xargs -0 lsd -l
}
find-folders() {
    if [[ "$1" == "-h" ]]; then
        echo "Usage: find-folders <directory> <search_term>"
        echo "Finds directories inside <directory> that contain <search_term> (case-insensitive)."
        echo
        echo "Example: find-folders /home user"
        echo "→ Finds directories in /home with 'user' in their name."
        return
    fi

    if [[ -z "$1" || -z "$2" ]]; then
        echo "Error: Missing arguments. Use -h for help."
        return 1
    fi

    find "$1" -type d -iname "*$2*" -print0 2>/dev/null | sort -z | xargs -0 lsd -dl
}

# Show both filesystem total space and usage
dustf() {
    print_title() {
        local text="$1"
        local text_len=${#text}
        local width=$(tput cols)
        local filler_len=$(( (width - text_len) / 2 ))
        local remainder=$(( (width - text_len) % 2 ))
        local filler=$(printf '%*s' "$filler_len" '' | tr ' ' '=')
        echo "${filler}${text}${filler}$( [ "$remainder" -eq 1 ] && echo "=" )"
    }
    sudo -v
    print_title "= Total Disk Space ="
    df -h -T /
    echo
    print_title "= Disk Usage Breakdown ="
    sudo dust -d 1 / 2>/dev/null
}

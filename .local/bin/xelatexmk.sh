#!/bin/bash

compileTex() {
    texName="$1"
    localDir="${PWD##*/}"
    localDir="${localDir:-/}"
    texName="${texName:=${localDir}}"

    latexmk -synctex=1 -interaction=nonstopmode -file-line-error -xelatex -shell-escape -outdir="." "${texName}.tex"
}

cleanTmp() {
    rm *.aux *.bbl *-blx.bib *.blg *.fdb_latexmk *.fls *.glg *.glo *.gls *.ist *.log *.out *.run.xml *.synctex.gz *.toc *.xdv >&2 /dev/null
    rm -r _minted-*/ >&2 /dev/null
}

usage() {
    echo "Usage: $0 -[c|h]"
    echo "Default:         Make the latex file into a pdf"
    echo "     -c          Clean temporary files created by latexmk"
    echo "     -h          Display this help message and exit"
}

while getopts "ch" opt; do
    case $opt in
        c)
            cleanTmp
            exit 0
            ;;
        h)
            usage
            exit 0
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument ." >&2
            exit 1
            ;;
    esac
done

if [[ $# -eq 0 ]]; then
    compileTex
fi

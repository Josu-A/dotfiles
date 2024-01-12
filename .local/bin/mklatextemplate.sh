#!/bin/bash

name="$1"
name="${name:="Template"}"
if [[ ! -d "$name"  &&  -d ~/Templates/'Latex Document' ]]; then
    mkdir "$name"
    cp -r ~/Templates/'Latex Document'/* "./${name}"
    mv "./${name}/main.tex" "./${name}/${name}.tex"
    sed -i 's/\\newcommand{\\doctitle}{Latex Template}/\\newcommand{\\doctitle}{'"${name}"'}/' "${name}/setup.tex"
else
    echo "bash: mklatextemplate: The project already exists, or the template can't be found!"
fi

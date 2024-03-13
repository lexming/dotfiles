# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
elif [ -f /etc/bash/bashrc ]; then
    source /etc/bash/bashrc
fi

# Custom aliases and functions
prependpath() {
    # update given environment variable name with given directory
    # path is prepended if it does not exist in environment variable
    # 1: path to directory
    # 2: name of environment variable
    local envar_name="${2:-PATH}"
    local envar_path="${!envar_name}"
    local new_path="$(realpath $1)"
    if [ -d "$new_path" ] && [[ ":${envar_path}:" != *":$new_path:"* ]]; then
        envar_path="${1}${envar_path+:${envar_path}}"
        export $envar_name="$envar_path"
    fi
}

# Source rc files
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

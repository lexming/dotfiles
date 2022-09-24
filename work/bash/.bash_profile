# .bash_profile

# User environment
prependpath() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${1}${PATH+:${PATH}}"
    fi
}

# Add user bin folders to PATH
prependpath "$HOME/bin"
prependpath "$HOME/.local/bin"
export PATH

# Default editor
export VISUAL="nvim"
export EDITOR="nvim"

# Shell history
export HISTSIZE=8000

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# .bash_profile

# User environment
pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

# Add user bin folders to PATH
pathadd "$HOME/bin"
pathadd "$HOME/.local/bin"
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

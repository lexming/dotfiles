# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Add user bin folders to PATH
prependpath "$HOME/.local/bin"

# Shell history
export HISTSIZE=8000


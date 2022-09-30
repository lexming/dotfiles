# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User environment
# Add user bin folders to PATH
prependpath "$HOME/bin"
prependpath "$HOME/.local/bin"

# Shell history
export HISTSIZE=8000

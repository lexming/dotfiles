# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Add user bin folders to PATH
prependpath "$HOME/.local/bin"

# Shell history
export HISTSIZE=8000

# Use KDE file dialog in GTK apps
export GTK_USE_PORTAL=1

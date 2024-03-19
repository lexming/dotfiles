# Early addition of user bin folder to PATH
prependpath "$HOME/.local/bin"

# ls aliases with and without eza
if hash eza 2>/dev/null; then
    alias ls="eza -F --group-directories-first --icons always"
    alias ll="ls -l -o --no-permissions --time-style iso"
    alias lt="ll -snew"
    alias la="ll -g --all --all"
else
    alias ls="ls --color=auto"
    alias ll="ls -alh"
    alias lt="ls -ltrh"
fi

# most recent file in cwd
most_recent_item="sort -nr | cut -c23- | head -n 1"
alias rf="find . -type f -printf '%T@ %p\n' | $most_recent_item"
alias rf1="find . -maxdepth 1 -type f -printf '%T@ %p\n' | $most_recent_item"
alias tfr='tail -f $(rf1)'

# sorted du on current folder
alias du1h="du -h --max-depth=1 | sort -h"

# automatically expand variables on tab completion
shopt -s direxpand
# argument to cd that is not a directory is assumed to be a variable
shopt -s cdable_vars

# Custom theme for dircolors
eval "$(dircolors ~/.dir_colors)"

# Fuzzy finder
if hash fzf 2>/dev/null; then
    source $HOME/.local/share/fzf/key-bindings.bash
    if hash fd 2>/dev/null; then
         export FZF_DEFAULT_COMMAND="fd --type f"
    fi
fi

# Enable Starship prompt
if hash starship 2>/dev/null; then
    export STARSHIP_LOG="error"
    starship_bin="$(which starship)"
    eval "$($starship_bin init bash)"
fi

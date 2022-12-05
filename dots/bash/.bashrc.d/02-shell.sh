alias ls="ls --color=auto"
alias ll="ls -alh"
alias lt="ls -ltrh"

# remove default bash completion
complete -r -D
# TAB using built-in completion for cd
complete -r cd

# Custom theme for dircolors
eval "$(dircolors ~/.dir_colors)"

# Fuzzy finder
if hash fzf 2>/dev/null; then
    source /usr/share/fzf/shell/key-bindings.bash
    if hash fd 2>/dev/null; then
         export FZF_DEFAULT_COMMAND="fd --type f"
    fi
fi

# Enable Starship prompt
starship_bin="$(env PATH=$HOME/bin:$PATH which starship)"
eval "$($starship_bin init bash)"

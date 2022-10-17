alias ls="ls --color=auto"
alias ll="ls -alh"
alias lt="ls -ltrh"

# TAB expand environement variables that refer to dirs
shopt -s direxpand
# TAB using built-in completion for cd
complete -r cd

# Custom theme for dircolors
eval "$(dircolors ~/.dir_colors)"

# Enable Starship prompt
starship_bin="$(env PATH=$HOME/bin:$PATH which starship)"
eval "$($starship_bin init bash)"

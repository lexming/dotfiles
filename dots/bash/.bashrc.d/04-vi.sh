if hash nvim 2>/dev/null; then
    vi="nvim"
elif hash vimx 2>/dev/null; then
    vi="vimx"
elif hash vim 2>/dev/null; then
    vi="vim"
fi

# Default editors
export VISUAL="$vi"
export EDITOR="$vi"
export SYSTEMD_EDITOR="$vi"

alias vi="$vi"

if hash wezterm 2>/dev/null; then
    # Always use simple printf and avoid spawning background jobs
    __wezterm_osc7 () {
        printf "\033]7;file://%s%s\033\\" "${HOSTNAME}" "${PWD}"
    }

    # Connect to remote multiplexer in a remote SSH host
    sshmux () {
        wezterm cli spawn --domain-name "SSHMUX:$1"
    }
fi

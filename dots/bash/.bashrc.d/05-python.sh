vact () {
    # activate virtual environment in standard location        
    if [ -f "$HOME/.local/venv/$1/pyvenv.cfg" ]; then
        source "$HOME/.local/venv/$1/bin/activate"
    else
        echo "ERROR - Unknown virtual environment: $1"
    fi
}

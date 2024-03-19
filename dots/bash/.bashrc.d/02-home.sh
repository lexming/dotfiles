# Early addition of user bin folder to PATH
prependpath "$HOME/.local/bin"

# Update link to VSC_SCRATCH on VSC clusters with shared home directory
if [ "$VSC_HOME" == "$HOME" ]; then
    ln -sfn $VSC_SCRATCH ~/scratch
fi

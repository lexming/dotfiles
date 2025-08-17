# start ssh-agent
# needs https://github.com/funtoo/keychain
if hash keychain 2>/dev/null; then
    keychain_cmd='keychain --quiet --noask --eval --timeout 60'
    ssh_keys='git_rsa domu_rsa vsc_rsa'
    eval $($keychain_cmd $ssh_keys)
fi

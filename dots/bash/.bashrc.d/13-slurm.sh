if hash sacct 2>/dev/null; then
    alias sjob="sacct -B -j"
fi

if [ "$VSC_INSTITUTE" == "brussel" ]; then
    alias mysqueue="mysqueue -M hydra,anansi"
    alias mysinfo="mysinfo -M hydra,anansi"
fi

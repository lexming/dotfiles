if hash onedrive 2>/dev/null; then
    # OneDrive
    alias od-sync="onedrive --sync"
    alias sp-sync="od-sync --confdir=~/.config/sharepoint"
    # full sync avoiding any removal of remote files
    alias od-safesync="od-sync --download-only && od-sync --upload-only --no-remote-delete"
    alias sp-safesync="sp-sync --download-only && sp-sync --upload-only --no-remote-delete"
fi

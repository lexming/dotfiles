cerberus_conf="$HOME/.config/sshuttle/cerberus.conf"
[ -f "$cerberus_conf" ] && alias cerberus-vpn="sshuttle @$cerberus_conf"

# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Custom theme for dircolors
eval $(dircolors ~/.dir_colors)

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

### Aliases
alias ls="ls --color=auto"
alias ll="ls -alh"
alias lt="ls -ltrh"
alias vi="nvim"

# sshuttle
alias cerberus-vpn="sshuttle @$HOME/.config/sshuttle/cerberus.conf"

# OneDrive
alias od-sync="onedrive --synchronize"
alias sp-sync="od-sync --confdir='~/.config/sharepoint'"
# full sync avoiding any removal of remote files
alias od-safesync="od-sync --download-only && od-sync --upload-only --no-remote-delete"
alias sp-safesync="sp-sync --download-only && sp-sync --upload-only --no-remote-delete"

# Enable Starship prompt
eval "$(starship init bash)"


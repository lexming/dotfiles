# Custom installation of Ruby Gems
GEM_HOME="${HOME}/.local/gems"
[ -d "$GEM_HOME" ] || return

export GEM_HOME
prependpath "$GEM_HOME/bin"

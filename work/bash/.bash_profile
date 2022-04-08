# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# Default editor
export VISUAL="nvim"
export EDITOR="nvim"

# Shell history
export HISTSIZE=8000

# Local EasyBuild environment
export MODULEPATH="${HOME}/easybuild/install/modules${MODULEPATH+":${MODULEPATH}"}"
export EASYBUILD_PREFIX="${HOME}/easybuild/install"
export EASYBUILD_GITHUB_USER='lexming'
export EASYBUILD_GIT_WORKING_DIRS_PATH="${HOME}/src/EB"

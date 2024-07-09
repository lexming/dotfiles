# EasyBuild environment
eb_prefix="${HOME}/easybuild/install"
[ -d "$eb_prefix" ] || return

# VSC clusters have installations for multiple architectures
[ ! -z "$VSC_ARCH_LOCAL" ] && eb_prefix="${eb_prefix}/${VSC_ARCH_LOCAL}"
export EASYBUILD_PREFIX="$eb_prefix"

mod_path="modules/all"
prependpath "${EASYBUILD_PREFIX}/${mod_path}" MODULEPATH

# GitHub integration
export EASYBUILD_GITHUB_USER="lexming"
export EASYBUILD_GIT_WORKING_DIRS_PATH="${HOME}/src/EB"

# Aliases
alias ebt='eb --rebuild --robot="$HOME/easybuild/easyconfigs" --trace'
alias eb1='eb --rebuild --robot="$HOME/easybuild/easyconfigs" --trace --parallel=1'
alias ebi='eb --force --inject-checksums=sha256'
alias ebact='source ~/.local/venv/eb/bin/activate'

alias pip-push='python -m pip install --upgrade --no-deps .'

# Remove locally installed packages with EB
verbose_rmdir () {
    if [ -d "$1" ]; then
        rm -rf "$1" && echo 'Done'
    else
        echo 'Not found'
    fi
}
ebrm () {
    [ -z "$1" ] && { echo "Missing package name"; return 1; }

    local pkg="$1"

    # Local repository
    local arch=${2:-skylake}
    local prefix="$(dirname $EASYBUILD_PREFIX)/$arch"

    local installdir="${prefix}/software/${pkg}"
    echo -n "Removing installed software ${pkg}... "
    verbose_rmdir $installdir

    local moddir="${prefix}/modules/"
    find $moddir -type d -name "${pkg}" | while read pkgmoddir; do
        echo -n "Removing modules of ${pkg} in $(basename $(dirname ${pkgmoddir}))... "
        verbose_rmdir "${pkgmoddir}"
    done

    local sourcedir="${prefix}/sources/$(echo ${pkg:0:1} | tr '[:upper:]' '[:lower:]')/${pkg}"
    echo -n "Removing downloaded sources of ${pkg}... "
    verbose_rmdir $sourcedir
}

# Print extensions that only exist in one of the given modules
ebextdiff () {
    ExtList1=$(module whatis $1 | grep -oP '(?<=Extensions: ).*$' | sed 's/\ .-.,//g' | sed 's/-[^\ ]*//g')
    ExtList2=$(module whatis $2 | grep -oP '(?<=Extensions: ).*$' | sed 's/\ .-.,//g' | sed 's/-[^\ ]*//g')
    AllExt=$(echo $ExtList1 $ExtList2 | tr ' ' '\n' | sort -u)
    for pkg in $AllExt; do
        if [[ "$ExtList1" == *"$pkg"* ]]; then
            pkg1=$pkg
        else
            pkg1='.'
        fi
        if [[ "$ExtList2" == *"$pkg"* ]]; then
            pkg2=$pkg
        else
            pkg2='.'
        fi
        printf "%-32s %s\n" $pkg1 $pkg2
    done
}

quattor-profile-grep () {
    XML_QUATTOR_DECODE='s/_2e/./g;s/_2a/*/g;s/_2d/-/g;s/_2f/\//g;s/_5f/_/g'
    zcat $1 | sed "$XML_QUATTOR_DECODE" | grep -C 8 $2
}

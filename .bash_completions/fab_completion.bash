_fab_completion() {
    COMPREPLY=()

    # Fab in the path?
#    /usr/bin/which fab || return 0

    # Fabfile in this folder?
    [[ -e fabfile.py ]] || [[ -e ../fabfile.py ]] || [[ -e ../../fabfile.py ]] || return 0

    local cur="${COMP_WORDS[COMP_CWORD]}"

    tasks=$(fab --shortlist)
    COMPREPLY=( $(compgen -W "${tasks}" -- ${cur}) )
}

complete -F _fab_completion fab

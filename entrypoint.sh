#!/bin/sh

: "${PROJECT_DIR:=/project}"
: "${GITMAN_CACHE:=/tmp}"
: "${FIX_PERMISSIONS:=1}"

isCommand() {
    case "$1" in
        init|install|update|list|lock|uninstall|show|edit)
            return 0;;
        *)
            echo "Unknown command '$1'"
            exit 1;;
    esac

}

export GITMAN_CACHE

if [ -n "$PROJECT_DIR" ] && [ -d "$PROJECT_DIR" ] && [ -w "$PROJECT_DIR" ]; then
    if [ "$(pwd)" = / ]; then
        if cd "$PROJECT_DIR"; then
            echo "Change directory into '$PROJECT_DIR'"
        else
            echo "Cannot change directory into '$PROJECT_DIR'"
            exit 1
        fi
    fi

    # check if the first argument passed in looks like a flag
    if [ "$(printf %c "$1")" = '-' ]; then
        set -- gitman "$@"
    # check if the first argument passed in is gitman
    elif [ "$1" = 'gitman' ]; then
        set -- "$@"
    # check if the first argument passed in matches a known command
    elif isCommand "$1"; then
        set -- gitman "$@"
    fi
else
    echo "PROJECT_DIR: $PROJECT_DIR Not usable or does not exist"
    exit 1
fi

if [ "$(id -u)" = 0 ] && [ "$FIX_PERMISSIONS" = 1 ]; then
    command "$@"
    if [ -f "${PROJECT_DIR}/gitman.yml" ] &&
        location="$(grep ^location: "${PROJECT_DIR}/gitman.yml" | cut -c11-)" &&
        [ -w "${PROJECT_DIR}/${location}" ];
    then
        chown --recursive --reference="$PROJECT_DIR" "${PROJECT_DIR}/${location}"
    fi
else
    exec "$@"
fi

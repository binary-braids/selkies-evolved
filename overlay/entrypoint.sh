#!/usr/bin/env bash
set -e

# If a command was passed, run that instead of the usual init process
if [ ! -z "$@" ]; then
    exec $@
    exit $?
fi

function print_header {
    # Magenta
    echo -e "\e[35m**** ${@} ****\e[0m"
}

function print_step_header {
    # Cyan
    echo -e "\e[36m  - ${@}\e[0m"
}

function print_warning {
    # Yellow
    echo -e "\e[33mWARNING: ${@}\e[0m"
}

function print_error {
    # Red
    echo -e "\e[31mERROR: ${@}\e[0m"
}

function print_note {
    # Cyan
    echo -e "\e[36mNOTE: ${@}\e[0m"
}

# Execute all container init scripts
for init_script in /etc/cont-init.d/*.sh ; do
    echo
    echo -e "\e[34m[ ${init_script:?}: executing... ]\e[0m"
    sed -i 's/\r$//' "${init_script:?}"
    source "${init_script:?}"
done
touch /tmp/.first-run-init-scripts
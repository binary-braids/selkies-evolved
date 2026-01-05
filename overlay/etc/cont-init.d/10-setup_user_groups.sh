#!/usr/bin/env bash

print_step_header "Adding default user to any additional required device groups"
additional_groups=( video audio input pulse sudo )
for group_name in "${additional_groups[@]}"; do
    if [ "$(getent group ${group_name:?})" ]; then
        print_step_header "Adding user '${USER}' to group: '${group_name}'"
        usermod -aG "${group_name:?}" "${USER}"
    fi
done

device_nodes=( /dev/uinput /dev/input/event* /dev/dri/* )
added_groups=""
for dev in "${device_nodes[@]}"; do
    # Only process $dev if it's a character device
    if [[ ! -c "${dev}" ]]; then
        continue
    fi

    # Get group name and ID
    dev_group=$(stat -c "%G" "${dev}")
    dev_gid=$(stat -c "%g" "${dev}")

    # Dont add root
    if [[ "${dev_gid}" = 0 ]]; then
        continue
    fi

    # Create a name for the group ID if it does not yet already exist
    if [[ "${dev_group}" = "UNKNOWN" ]]; then
        dev_group="user-gid-${dev_gid}"
        groupadd -g $dev_gid "${dev_group}"
    fi

    # Add group to user
    if [[ "${added_groups}" != *"${dev_group}"* ]]; then
        print_step_header "Adding user '${USER}' to group: '${dev_group}' for device: ${dev}"
        usermod -aG ${dev_group} ${USER}
        added_groups=" ${added_groups} ${dev_group} "
    fi
done
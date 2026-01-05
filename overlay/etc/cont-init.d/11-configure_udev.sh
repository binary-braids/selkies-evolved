#!/usr/bin/env bash

# Configure dbus
print_header "Configure udevd"


print_step_header "Ensure the default user has permission to r/w on input devices"
chmod 0666 /dev/uinput

echo -e "\e[34mDONE\e[0m"
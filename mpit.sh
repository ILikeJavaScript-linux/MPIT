#!/bin/bash

# Developed by ILikeJavaScript. MPIT Comes with absolutely no warranty.
# This is an alpha of Matrixis, so there will be errors.

RED="\033[0;31m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[0;33m"
RESET="\033[0m"

BUILDROOT_DIR="$(pwd)"
CONFIG_FILE="$BUILDROOT_DIR/.config"

function get_help() {s
    echo -e "Usage: $YELLOW mpit [argument|--install] [-h|--help] [-v|--version] $RESET"
    echo -e "$GREEN  -i, --install <package>  Install a package $RESET"
    echo -e "$GREEN  -h, --help               Get some help $RESET"
    echo -e "$GREEN  -v, --version            Version of Matrixis PIT $RESET"
}

function install_package() {
    set -e  # Exit immediately if a command fails

    local package_name="$1"
    if [ -z "$package_name" ]; then
        echo -e "$RED ERROR: No package name specified.$RESET"
        exit 1
    fi

    if [ ! -d "$BUILDROOT_DIR/package/$package_name" ]; then
        echo -e "$RED ERROR: Package '$package_name' not found in Buildroot.$RESET"
        exit 1
    fi

    if [ ! -f "$CONFIG_FILE" ]; then
        echo -e "$RED ERROR: Buildroot config file not found.$RESET"
        exit 1
    fi

    echo -e "$YELLOW Enabling $package_name in Buildroot...$RESET"
    echo "BR2_PACKAGE_$package_name=y" >> "$CONFIG_FILE"

    echo -e "$YELLOW Rebuilding system with $package_name...$RESET"
    make "$package_name"

    echo -e "$GREEN Package '$package_name' successfully enabled and built!$RESET"
}

function show_version() {
    echo -e "$BLUE GNU MPIT for Matrixis. Version 1.0.0r $RESET"
}

# Argument parsing
if [[ $# -eq 0 ]]; then
    get_help
    exit 1
fi

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -i|--install)
            if [[ -n "$2" ]]; then
                install_package "$2"
                shift 2
            else
                echo -e "$RED ERROR: No package name specified.$RESET"
                exit 1
            fi
            ;;
        -h|--help)
            get_help
            exit 0
            ;;
        -v|--version)
            show_version
            exit 0
            ;;
        *)
            echo -e "$RED ERROR: Unknown argument '$1'.$RESET"
            exit 1
            ;;
    esac
done


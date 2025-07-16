#!/bin/bash

source scripts/install_homebrew.sh
source scripts/install_cli_tools.sh
source scripts/install_gui_apps.sh
source scripts/install_python.sh
source scripts/install_vscode_extensions.sh
source scripts/setup_directories.sh
source scripts/configure_git.sh
source scripts/sync_dotfiles.sh

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

command_exists() {
    command -v "$1" &> /dev/null
}

main() {
    print_status "Starting Mac development environment setup..."
    print_status "This script will install essential development tools and applications"
    echo

    # Ask for sudo permission upfront
    sudo -v

    create_backup
    
    print_status "Checking Xcode Command Line Tools..."
    if ! xcode-select -p &> /dev/null; then
        print_status "Installing Xcode Command Line Tools..."
        xcode-select --install
        print_warning "Please complete the Xcode Command Line Tools installation and rerun this script"
        exit 1
    else
        print_success "Xcode Command Line Tools already installed"
    fi
    
    setup_directories

    install_homebrew
    install_cli_tools
    install_python

    install_gui_apps
    install_vscode_extensions

    configure_git
    sync_dotfiles

    print_success "Setup complete! Please restart your terminal."

}

# Run the main function
main "$@"
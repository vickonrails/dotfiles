install_cli_tools() {
    print_status "Installing command line tools..."
    
    local cli_tools=(
        "git"
        "curl"      
        "tree"
        "gh"
        "yarn"
        "pnpm"
        "bun"
        "deno"
        
        "postgresql"
        "mongodb-community"
    )

    # Add MongoDB tap
    brew tap mongodb/brew
    
    for tool in "${cli_tools[@]}"; do
        if brew list "$tool" &> /dev/null; then
            print_warning "$tool already installed"
        else
            print_status "Installing $tool..."
            brew install "$tool"
        fi
    done
    
    print_success "Command line tools installation completed"
}

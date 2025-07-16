
install_node() {
    print_status "Setting up Node.js environment..."
    
    if ! command_exists nvm; then
        print_status "Installing NVM..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
        
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
        
        print_success "NVM installed successfully"
    else
        print_success "NVM already installed"
    fi
    
    print_status "Installing Node.js LTS..."
    nvm install --lts
    nvm use --lts
    nvm alias default node
    print_success "Node.js setup completed"
}
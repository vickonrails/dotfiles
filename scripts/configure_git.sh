configure_git() {
    print_status "Setting up Git configuration..."
    
    if [[ -z $(git config --global user.name) ]]; then
        read -p "Enter your Git username: " git_username
        git config --global user.name "$git_username"
    fi
    
    if [[ -z $(git config --global user.email) ]]; then
        read -p "Enter your Git email: " git_email
        git config --global user.email "$git_email"
    fi
    
    # Set useful Git defaults
    git config --global init.defaultBranch main
    git config --global pull.rebase false
    git config --global core.autocrlf input
    git config --global core.editor "code --wait"
    
    print_success "Git configuration completed"
}
setup_directories() {
    print_status "Creating development directories..."
    
    # change to suit your needs
    local directories=(
        "$HOME/Desktop/projects"
        "$HOME/Desktop/work"
    )
    
    for dir in "${directories[@]}"; do
        if [[ ! -d "$dir" ]]; then
            mkdir -p "$dir"
            print_success "Created directory: $dir"
        else
            print_warning "Directory already exists: $dir"
        fi
    done
}
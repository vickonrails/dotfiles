# Sync dotfiles
sync_dotfiles() {
    print_status "Syncing dotfiles..."
    DOTFILES_REPO="https://github.com/victorofoegbu/dotfiles.git"
    DOTFILES_DIR="$HOME/.dotfiles"

    if [ ! -d "$DOTFILES_DIR" ]; then
        print_status "Cloning dotfiles repository..."
        git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
        print_success "Dotfiles repository cloned"
    else
        print_warning "Dotfiles repo already cloned, pulling latest changes..."
        cd "$DOTFILES_DIR" && git pull origin main
    fi

    # List of dotfiles to symlink
    local dotfiles=(
        ".zshrc"
        ".gitconfig"
        ".vimrc"
        ".bashrc"
    )

    local dot_folders=(
        ".config"
        ".gnupg"
        ".vim"
        ".config/nvim"
    )

    print_status "Creating symlinks for dotfiles..."
    for file in "${dotfiles[@]}"; do
        local source="$DOTFILES_DIR/$file"
        local target="$HOME/$file"
        
        # Create parent directory if it doesn't exist
        local target_dir=$(dirname "$target")
        if [ ! -d "$target_dir" ]; then
            mkdir -p "$target_dir"
        fi
        
        if [ -f "$source" ] || [ -d "$source" ]; then
            if [ -L "$target" ]; then
                rm "$target"
                print_status "Removed existing symlink: $target"
            elif [ -e "$target" ]; then
                mv "$target" "$target.backup.$(date +%Y%m%d_%H%M%S)"
                print_warning "Backed up existing file: $target"
            fi
            
            ln -sf "$source" "$target"
            print_success "Created symlink: $target -> $source"
        else
            print_warning "Source file not found: $source"
        fi
    done

    for file in "${dot_folders[@]}"; do
        local source="$DOTFILES_DIR/$file"
        local target="$HOME/$file"
        
        if [ -d "$source" ]; then
            if [ -L "$target" ]; then
                rm "$target"
                print_status "Removed existing symlink: $target"
            elif [ -e "$target" ]; then
                mv "$target" "$target.backup.$(date +%Y%m%d_%H%M%S)"
                print_warning "Backed up existing file: $target"
            fi
            
            ln -sf "$source" "$target"
            print_success "Created symlink: $target -> $source"
        else
            print_warning "Source directory not found: $source"
        fi
    done

    print_success "Dotfiles synced successfully"
}
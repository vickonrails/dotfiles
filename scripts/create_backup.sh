
create_backup() {
    local backup_dir="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$backup_dir"
    
    local files_to_backup=(.zshrc .gitconfig .vimrc .bashrc .config)
    
    for file in "${files_to_backup[@]}"; do
        if [ -e "$HOME/$file" ]; then
            cp -r "$HOME/$file" "$backup_dir/"
            print_success "Backed up $file"
        fi
    done
    
    echo "$backup_dir" > "$HOME/.dotfiles_last_backup"
    print_success "Backup created at: $backup_dir"
}
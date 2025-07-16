# Install GUI applications via Homebrew Casks
install_gui_apps() {
    print_status "Installing GUI applications..."
    
    local gui_apps=(
        "raycast"               # Spotlight replacement with powerful features
        "rectangle"             # Window management and snapping
        "jordanbaird-ice"       # Statusbar app manager
        
        "google-chrome"         
        "arc"                   
        "firefox"             
        
        "visual-studio-code"
        "cursor"                
        "iterm2"                
        "docker"                
        "insomnia"              
        "postman"               
        "tableplus"             
        
        "figma"                 
        
        "notion"                
        "discord"                   
        "microsoft-teams"   
        
        "spotify"               
        "obs"                  
        
        "1password"
    )
    
    for app in "${gui_apps[@]}"; do
        if brew list --cask "$app" &> /dev/null; then
            print_warning "$app already installed"
        else
            print_status "Installing $app..."
            brew install --cask "$app"
        fi
    done
    
    print_success "GUI applications installation completed"
}
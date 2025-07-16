# Install Python and Python tools
install_python() {
    print_status "Setting up Python environment..."
    
    if ! command_exists pyenv; then
        print_status "Installing pyenv..."
        brew install pyenv
        
        # Add pyenv to shell
        echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
        echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
        echo 'eval "$(pyenv init -)"' >> ~/.zprofile
        
        export PYENV_ROOT="$HOME/.pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init -)"
        
        print_success "pyenv installed successfully"
    else
        print_success "pyenv already installed"
    fi
    
    print_status "Installing Python..."
    local python_version="3.12.0"
    pyenv install "$python_version"
    pyenv global "$python_version"

    print_status "Installing Python packages..."
    pip install --upgrade pip

    # Install Python packages
    # virtual env for environment management
    # jupyter for data science
    # numpy for numerical computing
    # pandas for data manipulation and analysis
    # matplotlib for data visualization
    # requests for making HTTP requests
    # flask for building web applications
    pip install virtualenv pipenv poetry jupyter numpy pandas matplotlib requests fastapi
    
    print_success "Python setup completed"
}
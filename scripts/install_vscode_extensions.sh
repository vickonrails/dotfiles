# Install VS Code extensions
install_vscode_extensions() {
    print_status "Installing VS Code extensions..."
    
    local extensions=(
        # "alefragnani.bookmarks"
        "bierner.markdown-mermaid"
        "bradlc.vscode-tailwindcss"
        "britesnow.vscode-toggle-quotes"
        # "cardinal90.multi-cursor-case-preserve"
        # "christian-kohler.path-intellisense"
        # "dbaeumer.vscode-eslint"
        # "dotenv.dotenv-vscode"
        # "eamodio.gitlens"
        # "esbenp.prettier-vscode"
        # "formulahendry.auto-rename-tag"
        # "github.copilot"
        # "github.vscode-pull-request-github"
        # "GitLab.gitlab-workflow"
        # "humao.rest-client"
        # "lokalise.i18n-ally"
        # "meganrogge.template-string-converter"
        # "mermaidchart.vscode-mermaid-chart"
        # "mhutchie.git-graph"
        # "ms-azuretools.vscode-docker"
        # "ms-playwright.playwright"
        # "ms-python.debugpy"
        # "ms-python.python"
        # "ms-python.vscode-pylance"
        # "ms-vscode-remote.remote-containers"
        # "ms-vscode-remote.remote-ssh"
        # "ms-vscode.vscode-css"
        # "ms-vscode.vscode-emmet"
        # "ms-vscode.vscode-html"
        # "ms-vscode.vscode-json"
        # "ms-vscode.vscode-typescript-next"
        # "ms-vsliveshare.vsliveshare"
        # "pkief.material-icon-theme"
        # "pmndrs.pmndrs"
        # "redhat.vscode-yaml"
        # "ritwickdey.liveserver"
        # "robertz.code-snapshot"
        # "sanjulaganepola.github-local-actions"
        # "sdras.night-owl"
        # "shd101wyy.markdown-preview-enhanced"
        # "streetsidesoftware.code-spell-checker"
        # "streetsidesoftware.code-spell-checker-german"
        # "tamasfe.even-better-toml"
        # "tauri-apps.tauri-vscode"
        # "thebearingedge.vscode-sql-lit"
        # "vstirbu.vscode-mermaid-preview"
        # "wayou.vscode-todo-highlight"
        # "yoavbls.pretty-ts-errors"
    )
    
    for extension in "${extensions[@]}"; do
        if code --list-extensions | grep -q "$extension"; then
            print_warning "Extension $extension already installed"
        else
            print_status "Installing extension: $extension"
            code --install-extension "$extension"
            print_success "Successfully installed $extension"
            sleep 2
        fi
    done
    
    print_success "VS Code extensions installation completed"
}
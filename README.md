# Victor's Dotfiles

My personal WIP dotfiles setup for bootstrapping new development environments.

## Features

- **Quick Setup**: One-command installation for new machines
- **Curated**: Carefully selected essential tools without unnecessary bloat
- **Essential Tools**: Pre-configured with essential gui & cli tools I use everyday
- **Living**: Constantly changing as I learn more about zsh & bash scripting

## What's Included
- Homebrew installation
- Runtimes like python, node (nvm), etc
- VSCode, cursor and extensions I use regularly
- Well designed logging to help you understand what's being installed

## Installation
Go to your root directory `cd ~` and do the following...

```bash
git clone https://github.com/vickonrails/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The installer will:
1. Create a backup of your existing dotfiles. You'll need to customize `~/dotfiles/create_backup.sh` to match the dotfiles you want to backup (Wanted to keep this very simple). 
2. Install required applications. You can also update the list of applications to install in `~/dotfiles/install_cli_tools.sh` and `~/dotfiles/install_gui_apps.sh`. 
3. Move dotfiles to `~/dotfiles` and symlink them to `~/`

## Backup & Restore

Your existing configurations are automatically backed up to `~/.dotfiles_backup_YYYYMMDD_HHMMSS/` before installation.

## Roadmap

### Planned
- [ ] More robust backup system with restoration
- [ ] More config for specific tools e.g zsh theme, etc
- [ ] Multi-platform support (macOS, Linux, WSL)
- [ ] Improved error handling

## Contributing

This is a personal dotfiles setup, but suggestions and improvements are welcome via issues or pull requests.

## License

MIT License - feel free to fork and adapt for your own use.
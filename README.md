# Dotfiles

My personal dotfiles managed with [chezmoi](https://www.chezmoi.io/). These configurations are maintained across multiple machines including macOS, Windows/WSL, and devcontainers.

## 🖥️ Supported Environments

- **macOS** (primary)
- **Windows with WSL**
- **Devcontainers**

## 📁 Structure

```
~/.local/share/chezmoi/
├── dot_config/           # Configurations for various tools
│   ├── nvim/            # Neovim configuration
│   ├── tmux/            # Tmux configuration
│   └── zsh/             # Zsh configuration
├── dot_bash_profile     # Bash profile
├── dot_gitconfig.tmpl   # Git configuration (template)
├── dot_vimrc           # Vim configuration
└── scripts/            # Utility scripts
```

## 🛠️ Setup

1. Install chezmoi:
   ```bash
   sh -c "$(curl -fsLS get.chezmoi.io)"
   ```

2. Apply the dotfiles:
   ```bash
   chezmoi init --apply https://github.com/yourusername/dotfiles.git
   ```

## 🔄 Update

To update your local dotfiles:

```bash
chezmoi update
```

## ⚙️ Customization

### Machine-Specific Settings

- Use `.chezmoi.toml.tmpl` for machine-specific configurations
- Local overrides can be placed in `~/.config/local/`

### Secrets Management

Sensitive data is managed using:

```bash
chezmoi edit --encrypt path/to/secret
```

## 🧩 Included Configurations

- **Shell**: Zsh with Oh-My-Zsh
- **Editor**: Neovim with LSP support
- **Version Control**: Git
- **Terminal**: iTerm2 (macOS) / Windows Terminal (Windows)

## 🤝 Contributing

Feel free to submit issues or PRs for any improvements!

## 📜 License

MIT


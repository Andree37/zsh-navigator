# Zsh Navigator Plugin

The `zsh-navigator` plugin allows you to quickly navigate your workspace using `fzf` and optionally manage `tmux` sessions.

## Installation

### Using a Zsh Plugin Manager

1. **[Oh My Zsh](https://ohmyz.sh/)** or **[Zinit](https://github.com/zdharma-continuum/zinit)**:
   - Add the plugin to your `.zshrc`:
     ```zsh
     zinit light Andree37/zsh-navigator
     ```
   - Or for Oh My Zsh:
     ```zsh
     git clone https://github.com/Andree37/zsh-navigator.git $ZSH_CUSTOM/plugins/zsh-navigator
     plugins=(zsh-navigator)
     ```

2. Reload your Zsh configuration:
   ```zsh
   source ~/.zshrc

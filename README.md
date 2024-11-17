# Zsh Navigator Plugin

The `zsh-navigator` plugin allows you to quickly navigate your workspace using `fzf` and optionally manage `tmux` sessions or switch directories.

> Inspired by [ThePrimeagen](https://github.com/ThePrimeagen/.dotfiles/blob/602019e902634188ab06ea31251c01c1a43d1621/bin/.local/scripts/tmux-sessionizer) tmux-sessionizer script.

## Installation

### Using a Zsh Plugin Manager

1. **[Oh My Zsh](https://ohmyz.sh/)** or **[Zinit](https://github.com/zdharma-continuum/zinit)**:
   - Add the plugin to your `.zshrc`:
     zinit light Andree37/zsh-navigator
   - Or for Oh My Zsh:
```bash
git clone https://github.com/Andree37/zsh-navigator.git $ZSH_CUSTOM/plugins/zsh-navigator
```

Add the plugin to your `.zshrc`:
```bash
plugins=(zsh-navigator)
```

2. Reload your Zsh configuration:
```bash
source ~/.zshrc
```

## Configuration

### Mode Selection

Set the navigation mode in your `~/.zshrc`:

- TMUX Mode (default): Manage `tmux` sessions for projects.
```bash
export NAVIGATOR_MODE="tmux"
```

- CD Mode: Change the working directory.
```bash
export NAVIGATOR_MODE="cd"
```

### Keybinding

Keybinding is **disabled by default**. To enable it:

1. Set `NAVIGATOR_KEYBIND_ENABLED` to `true` in your `~/.zshrc`:
```bash
export NAVIGATOR_KEYBIND_ENABLED=true
```

2. (Optional) Set your preferred keybinding (default is `Ctrl+F`):
```bash
export NAVIGATOR_KEYBIND="^f"
```

3. Example Configuration in `.zshrc`:
```bash
export NAVIGATOR_KEYBIND_ENABLED=true
export NAVIGATOR_KEYBIND="^g"
```

### Workspace Structure

If your workspace uses the `WORKSPACE/src/PROJECT` structure (instead of `WORKSPACE/PROJECT`), add the following to your `~/.zshrc`:
export NAVIGATOR_SRC_STRUCTURE=true


### Example Configuration

```bash
plugins=(git zsh-navigator)
export NAVIGATOR_KEYBIND_ENABLED=true
export NAVIGATOR_MODE="tmux"
```

---

## Usage

1. Run the navigator:
   - Manually: `navigator`
   - Or, if keybinding is enabled: Press your configured key (e.g., `Ctrl+F`).

2. Use `fzf` to select a directory.

3. Depending on the mode:
   - TMUX Mode: Opens or switches to a `tmux` session.
   - CD Mode: Navigates to the selected directory in your terminal.

## Example Workflow

### TMUX Mode
1. Trigger the navigator (manually or with a keybinding).
2. Select a project using `fzf`.
3. The plugin starts or switches to a `tmux` session for the project.

### CD Mode
1. Trigger the navigator (manually or with a keybinding).
2. Select a project using `fzf`.
3. The terminal switches to the selected directory.

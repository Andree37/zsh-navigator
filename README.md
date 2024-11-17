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

2. (Optional) Set your preferred keybinding (default is `Ctrl+f`):
```bash
export NAVIGATOR_KEYBIND="^f"
```

3. (Optional) Set your preferred keybinding to go back into the initial directory (default is `Ctrl+h`):
```bash
export NAVIGATOR_ORIGINAL_PATH="^h"
```

4. Example Configuration in `.zshrc`:
```bash
export NAVIGATOR_KEYBIND_ENABLED=true
export NAVIGATOR_KEYBIND="^g"
```

### Workspace Structure

The `NAVIGATOR_STRUCTURE` variable allows you to define how your workspace is organized. Set it in your `~/.zshrc` to one of the following values:

1. workspace (default):
    - For directories structured as WORKSPACE/PROJECT/files.
```bash
export NAVIGATOR_STRUCTURE="workspace"
```

2. workspace_src:
    - For directories structured as WORKSPACE/src/PROJECT/files.
```bash
export NAVIGATOR_STRUCTURE="workspace_src"
```

3. unsorted:
    - For a flat list of directories directly under the base directory.
```bash
export NAVIGATOR_STRUCTURE="unsorted"
```

### Base Directory

If you want to navigate to a base directory, set the `NAVIGATOR_BASE_DIR` variable in your `~/.zshrc`:
```bash
export NAVIGATOR_BASE_DIR="$HOME/Projects"
```


### Example Configuration

```bash
plugins=(git zsh-navigator)
export NAVIGATOR_KEYBIND_ENABLED=true
export NAVIGATOR_MODE="tmux"
export NAVIGATOR_STRUCTURE="workspace"
```

---

## Usage

1. Run the navigator:
   - Manually: `navigator`
   - Or, if keybinding is enabled: Press your configured key (e.g., `Ctrl+f`).

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

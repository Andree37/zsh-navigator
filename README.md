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

---

## Configuration Options

### Overview

| **Variable**                      | **Default**    | **Type**   | **Description**                                 | **Examples**                             |
| --------------------------------- | -------------- | ---------- | ----------------------------------------------- | ---------------------------------------- |
| `NAVIGATOR_MODE`                  | `tmux`         | Mode       | Set the navigation mode.                        | `tmux`, `cd`                             |
| `NAVIGATOR_KEYBIND_ENABLED`       | `true`         | Keybinding | Enable keybindings.                             | `true`, `false`                          |
| `NAVIGATOR_KEYBIND`               | `^f`           | Keybinding | Keybinding to launch the navigator.             | `^g`, `^n`                               |
| `NAVIGATOR_ORIGINAL_PATH_KEYBIND` | `^h`           | Keybinding | Keybinding to return to the original directory. | `^x`, `^o`                               |
| `NAVIGATOR_STRUCTURE`             | `unsorted`     | Structure  | Define the workspace structure.                 | `workspace`, `workspace_src`, `unsorted` |
| `NAVIGATOR_BASE_DIR`              | `$HOME/github` | Directory  | Set the base directory for navigation.          | `/path/to/projects`                      |

---

### Detailed Explanation

- **`NAVIGATOR_MODE`**: Controls how the navigator operates (`tmux` for session management, `cd` for changing directories).
- **`NAVIGATOR_KEYBIND_ENABLED`**: Toggles keybinding functionality (`true` to enable, `false` to disable).
- **`NAVIGATOR_KEYBIND`**: Defines the keybinding for launching the navigator (default is `Ctrl+f`).
- **`NAVIGATOR_ORIGINAL_PATH_KEYBIND`**: Sets the keybinding for returning to the original directory (default is `Ctrl+h`).
- **`NAVIGATOR_STRUCTURE`**: Configures workspace organization (`workspace`, `workspace_src`, or `unsorted`).
- **`NAVIGATOR_BASE_DIR`**: Specifies the root directory for navigation.

### Structure Options

The `NAVIGATOR_STRUCTURE` variable allows you to define the structure of your workspace. The following options are available:

- **`workspace`**: Expects a workspace directory with subdirectories for each project. For example:

    ```
    ~/Projects
    ├── package1
    ├── package2
    ├── package3
    ```

- **`workspace_src`**: Expects a workspace directory with subdirectories for each project containing a `src` directory. For example:

    ```
      ~/Projects
      ├── src
      │   ├── package1
      │   ├── package2
      │   ├── package3
    ```

- **`unsorted`**: Does not expect any specific structure. All directories are listed without any assumptions and this is the default option.

---

### Example Configuration

Combine these settings in your `~/.zshrc` for a customized experience:

```bash
plugins=(git zsh-navigator)

# Enable keybindings
export NAVIGATOR_KEYBIND_ENABLED=true
export NAVIGATOR_KEYBIND="^f"
export NAVIGATOR_ORIGINAL_PATH_KEYBIND="^h"

# Set navigation mode
export NAVIGATOR_MODE="tmux"

# Define workspace structure
export NAVIGATOR_STRUCTURE="workspace"

# Set base directory
export NAVIGATOR_BASE_DIR="$HOME/Projects"
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

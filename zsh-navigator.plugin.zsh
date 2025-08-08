export PATH="${0:A:h}:$PATH"
export NAVIGATOR_PATH="${0:A:h}/navigator"

if [[ ! -x "$NAVIGATOR_PATH" ]]; then
    chmod +x "$NAVIGATOR_PATH"
fi

# Default configuration (can be overridden in ~/.zshrc)
export NAVIGATOR_MODE="${NAVIGATOR_MODE:-tmux}"           # Options: "tmux" or "cd"
export NAVIGATOR_BASE_DIR="${NAVIGATOR_BASE_DIR:-$HOME/github}" # Base directory for navigation
export NAVIGATOR_STRUCTURE="${NAVIGATOR_STRUCTURE:-unsorted}"   # Options: "unsorted", "workspace", "workspace_src"
export NAVIGATOR_WINDOW_NAMING="${NAVIGATOR_WINDOW_NAMING:-false}" # Enable automatic tmux window renaming? "true" or "false"

# Keybinding configuration
export NAVIGATOR_KEYBIND_ENABLED="${NAVIGATOR_KEYBIND_ENABLED:-true}" # Enable keybindings? "true" or "false"
export NAVIGATOR_KEYBIND="${NAVIGATOR_KEYBIND:-^f}"             # Keybinding to launch navigator
export NAVIGATOR_ORIGINAL_PATH_KEYBIND="${NAVIGATOR_ORIGINAL_PATH_KEYBIND:-^h}" # Keybinding to return to original directory

# Home path configuration (default directory to return to)
export NAVIGATOR_HOME_PATH="${NAVIGATOR_HOME_PATH:-.}"

navigator() {
    if [[ "$NAVIGATOR_MODE" == "cd" ]]; then
        source "$NAVIGATOR_PATH"
    else
        "$NAVIGATOR_PATH"
    fi
}

if [[ "$NAVIGATOR_KEYBIND_ENABLED" == true ]]; then
    bindkey -s "$NAVIGATOR_KEYBIND" "navigator\n"
    bindkey -s "$NAVIGATOR_ORIGINAL_PATH_KEYBIND" "cd \$NAVIGATOR_ORIGINAL_PATH\n"
fi

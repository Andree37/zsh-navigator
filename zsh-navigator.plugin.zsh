export PATH="${0:A:h}:$PATH"
export NAVIGATOR_PATH="${0:A:h}/navigator"

if [[ ! -x "$NAVIGATOR_PATH" ]]; then
    chmod +x "$NAVIGATOR_PATH"
fi

# Default configuration (can be overridden in ~/.zshrc)
export NAVIGATOR_MODE="${NAVIGATOR_MODE:-tmux}" # Options: "tmux" or "cd"
export NAVIGATOR_BASE_DIR="${NAVIGATOR_BASE_DIR:-$HOME/github}" # Base directory
export NAVIGATOR_STRUCTURE="${NAVIGATOR_STRUCTURE:-workspace}" # Options: "unsorted", "workspace", "workspace_src"
export NAVIGATOR_KEYBIND_ENABLED="${NAVIGATOR_KEYBIND_ENABLED:-true}" # Enable keybinding? "true" or "false"
export NAVIGATOR_KEYBIND="${NAVIGATOR_KEYBIND:-^f}" # Default keybinding (can be changed)
export NAVIGATOR_HOME_KEYBIND="${NAVIGATOR_KEYBIND:-^h}" # Default keybinding (can be changed)
export NAVIGATOR_HOME_PATH="${NAVIGATOR_HOME_PATH:-.}" # Default path to return to

navigator() {
    if [[ "$NAVIGATOR_MODE" == "cd" ]]; then
        source "$NAVIGATOR_PATH"
    else
        "$NAVIGATOR_PATH"
    fi
}

if [[ "$NAVIGATOR_KEYBIND_ENABLED" == true ]]; then
    bindkey -s "$NAVIGATOR_KEYBIND" "navigator\n"
    bindkey -s "$NAVIGATOR_HOME_KEYBIND" "cd $NAVIGATOR_ORIGINAL_PATH\n"
fi

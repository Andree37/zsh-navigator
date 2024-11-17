export PATH="${0:A:h}:$PATH"
export NAVIGATOR_PATH="${0:A:h}/navigator"

# Default configuration (can be overridden in ~/.zshrc)
export NAVIGATOR_MODE="${NAVIGATOR_MODE:-tmux}" # Options: "tmux" or "cd"
export NAVIGATOR_SRC_STRUCTURE="${NAVIGATOR_SRC_STRUCTURE:-false}" # Options: "true" or "false"
export NAVIGATOR_KEYBIND_ENABLED="${NAVIGATOR_KEYBIND_ENABLED:-false}" # Enable keybinding? "true" or "false"
export NAVIGATOR_KEYBIND="${NAVIGATOR_KEYBIND:-^f}" # Default keybinding (can be changed)

navigator() {
    $NAVIGATOR_PATH
}

if [[ "$NAVIGATOR_KEYBIND_ENABLED" == true ]]; then
    bindkey -s "$NAVIGATOR_KEYBIND" "navigator\n"
fi

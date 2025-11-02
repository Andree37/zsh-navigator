#!/usr/bin/env zsh

#--------------------------------------------------------------------#
# Zsh Navigator Plugin                                               #
#--------------------------------------------------------------------#
# Fast directory navigation with fuzzy search and tmux integration  #
# https://github.com/Andree37/zsh-navigator                         #
#--------------------------------------------------------------------#

export PATH="${0:A:h}:$PATH"
export NAVIGATOR_PATH="${0:A:h}/navigator"

if [[ ! -x "$NAVIGATOR_PATH" ]]; then
    chmod +x "$NAVIGATOR_PATH"
fi

#--------------------------------------------------------------------#
# Global Configuration Variables                                     #
#--------------------------------------------------------------------#

# Navigation mode: "tmux" or "cd"
(( ! ${+ZSH_NAVIGATOR_MODE} )) &&
typeset -g ZSH_NAVIGATOR_MODE='tmux'

# Base directory for navigation
(( ! ${+ZSH_NAVIGATOR_BASE_DIR} )) &&
typeset -g ZSH_NAVIGATOR_BASE_DIR="$HOME/github"

# Workspace structure: "unsorted", "workspace", "workspace_src"
(( ! ${+ZSH_NAVIGATOR_STRUCTURE} )) &&
typeset -g ZSH_NAVIGATOR_STRUCTURE='unsorted'

# Enable automatic tmux window renaming: "true" or "false"
(( ! ${+ZSH_NAVIGATOR_WINDOW_NAMING} )) &&
typeset -g ZSH_NAVIGATOR_WINDOW_NAMING='false'

# Enable keybindings: "true" or "false"
(( ! ${+ZSH_NAVIGATOR_KEYBIND_ENABLED} )) &&
typeset -g ZSH_NAVIGATOR_KEYBIND_ENABLED='true'

# Keybinding to launch navigator (in zsh bindkey format)
(( ! ${+ZSH_NAVIGATOR_KEYBIND} )) &&
typeset -g ZSH_NAVIGATOR_KEYBIND='^f'

# Keybinding to return to original directory
(( ! ${+ZSH_NAVIGATOR_ORIGINAL_PATH_KEYBIND} )) &&
typeset -g ZSH_NAVIGATOR_ORIGINAL_PATH_KEYBIND='^h'

# Home path configuration (default directory to return to)
(( ! ${+ZSH_NAVIGATOR_HOME_PATH} )) &&
typeset -g ZSH_NAVIGATOR_HOME_PATH='.'

#--------------------------------------------------------------------#
# Core Functions                                                     #
#--------------------------------------------------------------------#

# Export environment variables for the navigator script
_zsh_navigator_export_vars() {
    export NAVIGATOR_MODE="$ZSH_NAVIGATOR_MODE"
    export NAVIGATOR_BASE_DIR="$ZSH_NAVIGATOR_BASE_DIR"
    export NAVIGATOR_STRUCTURE="$ZSH_NAVIGATOR_STRUCTURE"
    export NAVIGATOR_WINDOW_NAMING="$ZSH_NAVIGATOR_WINDOW_NAMING"
    export NAVIGATOR_HOME_PATH="$ZSH_NAVIGATOR_HOME_PATH"
}

# Main navigator function
navigator() {
    _zsh_navigator_export_vars

    if [[ "$ZSH_NAVIGATOR_MODE" == "cd" ]]; then
        source "$NAVIGATOR_PATH"
    else
        "$NAVIGATOR_PATH"
    fi
}

# Set up keybindings
_zsh_navigator_bind_keys() {
    if [[ "$ZSH_NAVIGATOR_KEYBIND_ENABLED" == "true" ]]; then
        bindkey -s "$ZSH_NAVIGATOR_KEYBIND" "navigator\n"
        bindkey -s "$ZSH_NAVIGATOR_ORIGINAL_PATH_KEYBIND" "cd \$NAVIGATOR_ORIGINAL_PATH\n"
    fi
}


#--------------------------------------------------------------------#
# Initialization                                                     #
#--------------------------------------------------------------------#

# Initialize keybindings
_zsh_navigator_bind_keys

# Export initial environment variables
_zsh_navigator_export_vars

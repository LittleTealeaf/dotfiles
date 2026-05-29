#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

if [ -z "$DOT_FILES" ] || [ ! -d "$DOT_FILES" ]; then
    echo -e "${RED}Error: DOT_FILES environment variable is not set or directory does not exist.${NC}" >&2
    exit 1
fi

dest="$HOME/.gemini/config"
src_dir="$DOT_FILES/gemini"

echo -e "  [${BLUE}Linking${NC}] Linking Gemini configurations to $dest..."

# Ensure target parent directory exists
mkdir -p "$dest"

link_item() {
    local src="$1"
    local dest_item="$2"
    local name="$3"

    if [ -e "$dest_item" ] || [ -L "$dest_item" ]; then
        if [ -L "$dest_item" ] && [ "$(readlink -f "$dest_item")" = "$(readlink -f "$src")" ]; then
            echo -e "  [${GREEN}Linked${NC}] $dest_item already points to $name"
            return 0
        fi
        local backup="${dest_item}.bak"
        if [ -e "$backup" ] || [ -L "$backup" ]; then
            backup="${dest_item}.bak.$(date +%Y%m%d_%H%M%S)"
        fi
        echo -e "  [${YELLOW}Backup${NC}] Moving existing $dest_item to $backup"
        mv "$dest_item" "$backup"
    fi

    ln -s "$src" "$dest_item"
    echo -e "  [${GREEN}Created${NC}] Symlinked $dest_item -> $name"
}

# Link GEMINI.md
link_item "$src_dir/GEMINI.md" "$dest/GEMINI.md" "gemini/GEMINI.md"

# Link skills directory
link_item "$src_dir/skills" "$dest/skills" "gemini/skills"


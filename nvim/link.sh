#!/usr/bin/env bash
set -e
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

if [ -z "$DOT_FILES" ] || [ ! -d "$DOT_FILES" ]; then
    echo -e "${RED}Error: DOT_FILES environment variable is not set or directory does not exist.${NC}" >&2
    exit 1
fi

mkdir -p "$HOME/.config/nvim"

link_item() {
    local src="$1"
    local dest="$2"
    local name="$3"

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        if [ -L "$dest" ] && [ "$(readlink -f "$dest")" = "$(readlink -f "$src")" ]; then
            echo -e "  [${GREEN}Linked${NC}] $dest already points to $name"
            return 0
        fi
        local backup="${dest}.bak"
        if [ -e "$backup" ] || [ -L "$backup" ]; then
            backup="${dest}.bak.$(date +%Y%m%d_%H%M%S)"
        fi
        echo -e "  [${YELLOW}Backup${NC}] Moving existing $dest to $backup"
        mv "$dest" "$backup"
    fi

    ln -sfn "$src" "$dest"
    echo -e "  [${GREEN}Created${NC}] Symlinked $dest -> $name"
}

link_item "$DOT_FILES/nvim/init.lua" "$HOME/.config/nvim/init.lua" "nvim/init.lua"
link_item "$DOT_FILES/nvim/lsp" "$HOME/.config/nvim/lsp" "nvim/lsp"
link_item "$DOT_FILES/nvim/lua" "$HOME/.config/nvim/lua" "nvim/lua"
link_item "$DOT_FILES/nvim/ftplugin" "$HOME/.config/nvim/ftplugin" "nvim/ftplugin"


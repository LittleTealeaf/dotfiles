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

src="$DOT_FILES/vim/vimrc"
dest="$HOME/.vimrc"

mkdir -p "$(dirname "$dest")"

if [ -e "$dest" ] || [ -L "$dest" ]; then
    if [ -L "$dest" ] && [ "$(readlink -f "$dest")" = "$(readlink -f "$src")" ]; then
        echo -e "  [${GREEN}Linked${NC}] $dest already points to vim/vimrc"
        exit 0
    fi
    backup="${dest}.bak"
    if [ -e "$backup" ] || [ -L "$backup" ]; then
        backup="${dest}.bak.$(date +%Y%m%d_%H%M%S)"
    fi
    echo -e "  [${YELLOW}Backup${NC}] Moving existing $dest to $backup"
    mv "$dest" "$backup"
fi

ln -s "$src" "$dest"
echo -e "  [${GREEN}Created${NC}] Symlinked $dest -> vim/vimrc"

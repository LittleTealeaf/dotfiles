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

echo -e "  [${BLUE}Syncing${NC}] Syncing Gemini configurations to $dest..."

# Ensure target directories exist
mkdir -p "$dest/skills"

# Copy GEMINI.md
cp -rf "$src_dir/GEMINI.md" "$dest/GEMINI.md"

# Copy directory contents (including hidden files like .gitkeep)
cp -a "$src_dir/skills/." "$dest/skills/"

echo -e "  [${GREEN}Success${NC}] Copied gemini configurations to $dest"

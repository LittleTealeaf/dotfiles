#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

if [ "$#" -lt 1 ]; then
    echo -e "${RED}Error: Please provide a GitHub repository URL.${NC}"
    echo -e "Usage: $0 <repo_url> [custom_temp_dir_name]"
    exit 1
fi

REPO_URL="$1"
# Extract repo name from URL to make a nice directory name
REPO_NAME=$(basename -s .git "$REPO_URL")
TEMP_DIR_NAME="${2:-$REPO_NAME}"

# Ensure target path is in /tmp
TEMP_PATH="/tmp/explore_${TEMP_DIR_NAME}"

# If destination already exists, remove it first to ensure a clean state
if [ -d "$TEMP_PATH" ]; then
    echo -e "${YELLOW}Directory $TEMP_PATH already exists. Cleaning up older clone first...${NC}"
    rm -rf "$TEMP_PATH"
fi

echo -e "${BLUE}Cloning repository with depth 1 (shallow clone)...${NC}"
echo -e "URL: ${GREEN}${REPO_URL}${NC}"
echo -e "Target: ${GREEN}${TEMP_PATH}${NC}"

# Git depth 1 is the shallowest clone (latest commit only)
git clone --depth 1 "$REPO_URL" "$TEMP_PATH"

echo -e "\n${GREEN}✓ Repository successfully cloned to: ${TEMP_PATH}${NC}"
echo -e "${BLUE}Contents preview:${NC}"
if command -v tree &>/dev/null; then
    tree -L 2 "$TEMP_PATH"
else
    find "$TEMP_PATH" -maxdepth 2 -not -path '*/.*' | sort
fi

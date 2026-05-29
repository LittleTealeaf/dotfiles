#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Determine the dotfiles directory and export DOT_FILES
export DOT_FILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "${BLUE}=== Global Dotfiles Installation Script ===${NC}"
echo -e "Dotfiles directory: ${GREEN}${DOT_FILES}${NC}\n"

# Find all link.sh files in sub-directories dynamically
mapfile -t SUB_PROJECTS < <(find "$DOT_FILES" -mindepth 2 -maxdepth 2 -name "link.sh" | sort)

if [ ${#SUB_PROJECTS[@]} -eq 0 ]; then
    echo -e "${RED}Error: No sub-project link.sh scripts found!${NC}"
    exit 1
fi

echo -e "${BLUE}Running installation scripts for each sub-project...${NC}"
for script in "${SUB_PROJECTS[@]}"; do
    project_dir="$(dirname "$script")"
    project_name="$(basename "$project_dir")"
    
    echo -e "\n${BLUE}--- Installing ${project_name} ---${NC}"
    # Run the script in its own directory in a subshell
    (
        cd "$project_dir"
        bash "./link.sh"
    )
done

echo -e "\n${GREEN}✓ All dotfiles sub-projects linked/installed successfully!${NC}"

#!/bin/bash

if [ -z "$DOT_FILES" ] || [ ! -d "$DOT_FILES" ]; then
    # 2. If it doesn't, print an error and cancel early
    echo "Error: DOT_FILES environment variable is not set or directory does not exist." >&2
    exit 1
fi


ln -sf "$DOT_FILES/nvim/init.lua" ~/.config/nvim/init.lua
ln -sf "$DOT_FILES/nvim/lsp" ~/.config/nvim/lsp
ln -sf "$DOT_FILES/nvim/lua" ~/.config/nvim/lua
ln -sf "$DOT_FILES/nvim/ftplugin" ~/.config/nvim/ftplugin

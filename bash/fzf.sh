#!/bin/bash

# Catppuccin Colors
# export FZF_DEFAULT_OPTS="--color=bg:#1e1e2e,fg:#cdd6f4 \
# 	--color=border:#45475a,header:#cba6f7,pointer:#f5e0dc \
# 	--color=marker:#f5e0dc,info:#cba6f7,prompt:#cba6f7 \
# 	--color=fg+:#cdd6f4,bg+:#313244,hl:#f38ba8,hl+:#f38ba8 \
# 	--color=spinner:#cba6f7"

# Catppuccin Colors that mimic the telescope appearance
export FZF_DEFAULT_OPTS="--color=bg:#181826,fg:#cdd6f4,border:#181826 \
	--color=header:#cdd6f4,pointer:#cdd6f4,info:#89b4fb \
	--color=fg+:#cdd6f4,bg+:#45475b \
	--color=hl:#89b4fb,hl+:#89b4fb"

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --height=20 --layout=reverse --info=inline"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind 'tab:down' --bind 'btab:up' --bind 'ctrl-a:toggle-all' --bind 'alt-enter:toggle'"
export FZF_CTRL_T_COMMAND="fd --type f --strip-cwd-prefix"
export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix'

if command -v fzf &> /dev/null; then
	if test -f /usr/share/fzf/completion.bash; then
		source /usr/share/fzf/completion.bash
	fi
	if test -f /usr/share/fzf/key-bindings.bash; then
		source /usr/share/fzf/key-bindings.bash
	fi
fi

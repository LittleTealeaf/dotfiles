#!/bin/bash
export FZF_DEFAULT_OPTS='--layout=reverse --info=inline --color=fg:#cad3f5,bg:-1,hl:#ee99a0 --color=fg+:#b7bdf8,bg+:,hl+:#ed8796 --color=info:#b7bdf8,prompt:#b7bdf8,pointer:#b7bdf8 --color=marker:#b7bdf8,spinner:#b7bdf8,header:#b7bdf8,border:#b7bdf8,bg+:#24273a'
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind 'tab:down' --bind 'btab:up' --bind 'ctrl-a:toggle-all' --bind 'alt-enter:toggle'"
export FZF_CTRL_T_COMMAND="fd --type f --strip-cwd-prefix"
export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix'

if command -v fzf &> /dev/null; then
	source /usr/share/fzf/completion.bash
	source /usr/share/fzf/key-bindings.bash
fi

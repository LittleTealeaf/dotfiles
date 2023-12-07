# Alt + Z for zoxide fzf

# export _ZO_FZF_OPTS="$FZF_DEFAULT_OPTS"
export _ZO_FZF_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --bind=ctrl-z:ignore --reverse --scheme=path ${FZF_DEFAULT_OPTS-} ${FZF_ALT_C_OPTS-} +m"

__zoxide_select__() {
	dir=$(zi && pwd) && printf 'builtin cd -- %q' "$dir"
}

bind -m emacs-standard '"\ez": " \C-b\C-k \C-u`__zoxide_select__`\e\C-e\er\C-m\C-y\C-h\e \C-y\ey\C-x\C-x\C-d"'

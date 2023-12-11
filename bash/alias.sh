alias gsc='git forgit checkout_commit'
alias gsb='git forgit checkout_branch'
alias gl='git forgit log'
alias gc='git commit'
alias gp='git push'
alias gP='git pull'
alias :q=exit
alias g='git'

if command -v batgrep &> /dev/null; then
	alias rg='batgrep'
fi

if command -v batdiff &> /dev/null; then
	alias gd='batdiff'
fi

if command -v batman &> /dev/null; then
	alias man='batman'
fi

if command -v helix &> /dev/null; then
	alias hx='helix'
fi

if command -v felix &> /dev/null; then
	alias fx='felix'
fi

if command -v lazygit > /dev/null; then
	alias lg=lazygit
fi

if command -v kitty > /dev/null; then
	alias icat="kitty +kitten icat"
fi

if command -v nvim &> /dev/null; then
	alias nv='nvim'
fi

if command -v eza &> /dev/null; then
	alias ls="eza"
	alias ll="eza -l"
	alias la="eza -a"
	alias tree="eza --tree"
fi

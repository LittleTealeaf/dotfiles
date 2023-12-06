alias gcc='git forgit checkout_commit'
alias gcb='git forgit checkout_branch'
alias gl='git forgit log'
alias gc='git commit'
alias gp='git push'
alias gP='git pull'


if command -v batgrep &> /dev/null; then
	alias rg='batgrep'
fi

if command -v batdiff &> /dev/null; then
	alias gd='batdiff'
fi

if command -v batman &> /dev/null; then
	alias man='batman'
fi

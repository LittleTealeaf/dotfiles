export PATH="$DOT_FILES/bin:$PATH"
export PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')
export DEV="$HOME/dev"

source $DOT_FILES/bash/fzf.sh
source $DOT_FILES/bash/functions.sh
source $DOT_FILES/bash/alias.sh
source $DOT_FILES/bash/zoxide.sh


if command -v starship > /dev/null; then
	export STARSHIP_CONFIG="$DOT_FILES/starship/starship.toml"
	eval "$(starship init bash)"
else
	echo "Please install starship to properly set up configurations"
fi

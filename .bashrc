eval "$(oh-my-posh init bash --config $DOT_FILES/theme.omp.json)"


export PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')

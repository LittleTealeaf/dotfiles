eval "$(oh-my-posh init bash --config ./theme.omp.json)"


# Reduce path to only one item at a time
export PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')

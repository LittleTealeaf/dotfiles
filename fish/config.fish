set -g fish_function_path $fish_function_path "$DOT_FILES"/fish/functions
set -g SHELL $(which fish)

set -g FZF_DEFAULT_OPTS --border --layout=reverse --info=inline --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796

# set FZF_DEFAULT_OPTS --border

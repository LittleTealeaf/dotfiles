# dot files


## Initial Shell Setup

### Bash

Modify and put the following at the bottom of your .bashrc
```bash
export DOT_FILES="path/to/this/directory"
source "$DOT_FILES/bash/.bashrc"
```


## Oh-My-Posh Setup

Install Oh-My-Posh, and then use the following to set up the config

### Bash
Put the following in your .bashrc
```bash
eval "$(oh-my-posh init bash --config $DOT_FILES/omp/theme.omp.json)"
```

## Nvim Setup

To install the nvim setup, use the following commands to set your lua configuation

```shell
ln -sf "$DOT_FILES/nvim/init.lua" ~/.config/nvim/init.lua
ln -sf "$DOT_FILES/nvim/lua" ~/.config/nvim/lua
```

## Kitty Setup

If you are using the kitty terminal, use the following command to sym-link your kitty configuration

```shell
ln -sf "$DOT_FILES/kitty/kitty.conf" ~/.config/kitty/kitty.conf
```

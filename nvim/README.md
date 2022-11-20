# Neovim Configuration

As it stands, this is the first mostly complete configuration setup for neovim. I am a relatively new user, so I am sure there are flaws.

## Plugins

I've decided to use `Packer` for plugins. It seemed to be the easiest to include in configuration files, which made this whole dotfile repository possible

## Requirements

Some of the plugins do require you to have additional programs installed locally. Below is a list of requirements, their sources, and an installation script or link to help you meet the requirements

| Source | Requirement | Help Steps |
| :--: | :--: | :--: |
| Wakatime | Wakatime | You will need to set up a wakatime account, and obtain the api key to paste in. I use this to track my coding stats, which is used in a few of my CI projects. If you do not wish to use this plugin, you can simply remove the wakatime plugin in `nvim/lua/config/plugins.lua` |

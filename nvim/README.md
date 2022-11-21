# Neovim Configuration

As it stands, this is the first mostly complete configuration setup for neovim. I am a relatively new user, so I am sure there are flaws.

## Plugins

I've decided to use `Packer` for plugins. It seemed to be the easiest to include in configuration files, which made this whole dotfile repository possible

## Requirements

Some of the plugins do require you to have additional programs installed locally. Below is a list of requirements, their sources, and an installation script or link to help you meet the requirements

| Source | Requirement | Help Steps |
| :-- | :-- | :-- |
| Wakatime | Wakatime | You will need to set up a wakatime account, and obtain the api key to paste in. I use this to track my coding stats, which is used in a few of my CI projects. If you do not wish to use this plugin, you can simply remove the wakatime plugin in `nvim/lua/config/plugins.lua` |


## Keybinds

### The Leader Key

While in normal mode, many of the plugins have many useful keybinds. I've customized my keybinds in a tree-like structure. The keybinds will follow the following format (most of the time).

```
<leader> <key for plugin> <key for action>
```

In my configuration, the leader key is `;`.

For a quick example, the two most used binds I use is "fuzzy search" and "file explorer" in the "telescope" plugin. Because the telscope plugin works with files, its keybinds have the `f` prefix.

- `;ff` - Open the fuzzy File search
- `;fe` - Open the file Explorer

Below is a complete list of all the keybinds that follow this format

| Keybind | Plugin | Action |
| :--: | :--: | :-- |
| `;ff` | Telescope | Open the Fuzzy File Search |
| `;fe` | Telescope | Open the File Explorer |
| `;fg` | Telescope  | Open the Grep Search | 
| `;fw` | Telescope | Searches for the string currently under your cursor |
| `;fb` | Telescope | Open the Buffer Search | 
| `;fo` | Telescope | Search previously opened files |
| `;ft` | Telescope (Tabs Extension) | Open the Tabs Search |
| `;fs` | Telescope (Session Extension) | Open Sessions |
| `;gi` | Telescope (Github Extension) | Open Github Issues |
| `;gp` | Telescope (Github Extensions) | Open Github Pull Requests |
| `;gg` | Telescope (Github Extension) | Open Gists |
| `;gr` | Telescope (Github Extension) | Open Workflow Runs |
| `;gc` | Telescope | Open Git Commit List |
| `;gs` | Telescope | Open Git Status | 
| `;ba` | Bookmarks | Open all Bookmarks |
| `;bs` | Bookmarks | Open All Bookmarks in File |
| `;bb` | Bookmarks | Toggle Bookmark |
| `;bt` | Bookmarks | Edit Bookmark Annotation |
| `;bj` | Bookmarks | Next Bookmark |
| `;bk` | Bookmarks | Previous Bookmark |
| `;bc` | Bookmarks | Clear Bookmark |
| `;bC` | Bookmarks | Clear All Bookmarks | 
| `;cn` | Coc | Rename Symbol |
| `;cd` | Coc | Goto Definition |
| `;ct` | Coc | Goto Type Definition |
| `;ci` | Coc | Goto Implementation |
| `;cr` | Coc | Goto References | 
| `;ca` | Coc | Code Action |

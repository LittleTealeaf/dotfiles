local wezterm = require('wezterm')

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font 'JetBrainsMono NFM'
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = 'catppuccin-mocha'

return config

local gui = require 'gui'
local keybinds = require 'keybinds'
local font = require 'font'
local config = {}

gui.apply_to_config(config)
keybinds.apply_to_config(config)
font.apply_to_config(config)

config.scrollback_lines = 5000

return config

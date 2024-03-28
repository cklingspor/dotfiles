local gui = require 'gui'
local keybinds = require 'keybinds'
local font = require 'font'
local cursor = require 'cursor'
local mouse = require 'mouse'
local config = {}

gui.apply_to_config(config)
keybinds.apply_to_config(config)
font.apply_to_config(config)
cursor.apply_to_config(config)
mouse.apply_to_config(config)
config.scrollback_lines = 5000

return config

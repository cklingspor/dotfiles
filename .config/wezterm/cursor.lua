local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
    config.cursor_blink_ease_in = 'Constant'
    config.cursor_blink_ease_out = 'Constant'
    config.cursor_blink_rate = 500
    config.default_cursor_style = 'BlinkingBlock'
end

return module


local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
  config.font = wezterm.font {
    family = 'Fira Code',
    harfbuzz_features = {"zero" , "ss01", "cv05"}
  }
  config.font_size = 16.0
  config.line_height = 1.2
end

return module


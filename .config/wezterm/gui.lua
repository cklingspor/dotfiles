local wezterm = require 'wezterm'
local module = {}
local mux = wezterm.mux

-- Maximize on startup
wezterm.on('gui-startup', function(cmd)
 local tab, pane, window = mux.spawn_window(cmd or {})
 window:gui_window():maximize()
end)

function module.apply_to_config(config)
  config.window_decorations = "RESIZE"
  config.inactive_pane_hsb = {
   saturation = 0.8,
   brightness = 0.7,
  }
  config.color_scheme = 'rose-pine'
  config.use_fancy_tab_bar = false
  config.hide_tab_bar_if_only_one_tab = true
  config.window_background_opacity = 0.95
end

return module

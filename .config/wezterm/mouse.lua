local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
    config.mouse_bindings = {
        -- Copy selection
        {
            event = { Up = { streak = 1,button = "Right"}},
            mods = "NONE",
            action = wezterm.action{PasteFrom = "PrimarySelection"}
        },
        -- Copy selection
        {
            event = { Up = {streak = 1,button = "Left"}},
            mods = "NONE",
            action = wezterm.action{CompleteSelectionOrOpenLinkAtMouseCursor = "PrimarySelection"}
        }
    }
end

return module


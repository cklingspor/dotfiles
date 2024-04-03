local wezterm = require 'wezterm'
local module = {}
local action = wezterm.action

-- Maximize on startup
function module.apply_to_config(config)
  config.keys = {
    -- Display Tab Navigator
    {
      key = 't',
      mods = 'CMD|SHIFT',
      action = action.ShowTabNavigator,
    },
    -- Open Wizterm config
    {
      key = ',',
      mods = 'CMD',
      action = action.SpawnCommandInNewTab {
        cwd = os.getenv('WEZTERM_CONFIG_DIR'),
        set_environment_variables = {
          TERM = 'screen-256color',
        },
        args = {
          '/usr/bin/vim',
          os.getenv('WEZTERM_CONFIG_FILE'),
        },
      },
    },
   -- Other configs
  {
    key = "c",
    mods = "CTRL|SHIFT",
    action = action{CopyTo = "Clipboard"},
  },
  {
    key = "v",
    mods = "CTRL|SHIFT",
    action = action{PasteFrom = "Clipboard"},
  },
  {
    key = "LeftArrow",
    mods = "CTRL|SHIFT",
    action = action{ActivateTabRelative = -1},
  },
  {
    key = "RightArrow",
    mods = "CTRL|SHIFT",
    action = action{ActivateTabRelative = 1},
  },
  {
    key = "Enter",
    mods = "CTRL|SHIFT",
    action = action{SpawnTab = "CurrentPaneDomain"},
  },
  {
    key = "r",
    mods = "CTRL|SHIFT",
    action = action.ReloadConfiguration,
  },
  {
    key = "f",
    mods = "CTRL|SHIFT",
    action = action.Search{CaseInSensitiveString = ""},
  },
  -- CaseInSensitive search...
  {
    key="f",
    mods="CTRL|SHIFT",
    action=wezterm.action_callback(
        function(window, pane)
            local selection = window:get_selection_text_for_pane(pane)
            window:perform_action(action{Search={CaseInSensitiveString=selection}}, pane)
        end
    )
  },
  {
    key = "n",
    mods = "CTRL|SHIFT",
    action = action.SpawnWindow,
  },
  {
    key = "w",
    mods = "CTRL|SHIFT",
    action = action{CloseCurrentTab = {confirm=true}},
  },
  {
    key = "1",
    mods = "CTRL",
    action = action{ActivateTab = 0},
  },
  {
    key = "2",
    mods = "CTRL",
    action = action{ActivateTab = 1},
  },
  {
    key = "3",
    mods = "CTRL",
    action = action{ActivateTab = 2},
  },
  {
    key = "4",
    mods = "CTRL",
    action = action{ActivateTab = 3},
  },
  {
    key = "5",
    mods = "CTRL",
    action = action{ActivateTab = 4},
  },
  {
    key = "6",
    mods = "CTRL",
    action = action{ActivateTab = 5},
  },
  {
    key = "7",
    mods = "CTRL",
    action = action{ActivateTab = 6},
  },
  {
    key = "8",
    mods = "CTRL",
    action = action{ActivateTab = 7},
  },
  {
    key = "9",
    mods = "CTRL",
    action = action{ActivateTab = 8},
  },
  {
    key = "0",
    mods = "CTRL",
    action = action{ActivateTab = 9},
  },
  {
    key = "Enter",
    mods = "CTRL",
    action = action{SplitHorizontal = {domain="CurrentPaneDomain"}},
  },
  {
    key = "Enter",
    mods = "CTRL|SHIFT",
    action = action{SplitVertical = {domain="CurrentPaneDomain"}},
  },
  -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
  {
    key="LeftArrow",
    mods="OPT",
    action=wezterm.action{SendString="\x1bb"}
  },
  -- Make Option-Right equivalent to Alt-f; forward-word
  {
    key="RightArrow", 
    mods="OPT", 
    action=wezterm.action{SendString="\x1bf"}
  },  
}
  -- Disable dead keys
  config.use_dead_keys = false

end

return module

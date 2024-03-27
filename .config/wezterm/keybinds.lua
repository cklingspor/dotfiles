local wezterm = require 'wezterm'
local module = {}
local act = wezterm.action

-- Maximize on startup
function module.apply_to_config(config)
  config.keys = {
    -- Display Tab Navigator
    {
      key = 't',
      mods = 'CMD|SHIFT',
      action = act.ShowTabNavigator,
    },
    -- Open Wizterm config
    {
      key = ',',
      mods = 'CMD',
      action = act.SpawnCommandInNewTab {
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
  }

  -- Disable dead keys
  config.use_dead_keys = false

end

return module

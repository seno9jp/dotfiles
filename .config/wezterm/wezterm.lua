local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- WSL Ubuntuをデフォルトドメインとして設定
config.default_domain = 'WSL:Ubuntu-24.04'

config.font_size = 10.0
config.color_scheme = 'Kasugano (terminal.sexy)'


return config
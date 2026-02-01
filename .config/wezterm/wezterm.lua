local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- WSL Ubuntuをデフォルトドメインとして設定
config.default_domain = 'WSL:Ubuntu-24.04'

-- フォント設定
config.font = wezterm.font("JetBrains Mono",{weight="Regular", stretch='Normal', style='Normal'})
config.font_size = 10.0
config.color_scheme = 'Kasugano (terminal.sexy)'

-- カーソル設定
config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_rate = 480
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

-- -- ウィンドウ設定
-- config.window_decorations = "RESIZE"
config.window_background_opacity = 0.75
config.macos_window_background_blur = 10
config.window_background_gradient = {
    colors = { "#000000" },
}

-- -- タブバー設定
-- config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
-- config.tab_max_width = 5
-- config.show_close_tab_button_in_tabs = false

-- ウィンドウフレーム設定
config.window_frame = {
    inactive_titlebar_bg = "none",
    active_titlebar_bg = "none",
}



return config
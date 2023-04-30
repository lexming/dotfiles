local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

-- updates
config.check_for_updates = false
-- scrollback
config.scrollback_lines = 8000
-- padding
config.window_padding = {
    left = '2cell',
    right = '2cell',
    top = '1cell',
    bottom = '1cell',
}
-- font settings
config.font = wezterm.font("JetBrains Mono")
config.custom_block_glyphs = false
-- Whimsy, tokyonight, lovelace, Firewatch, Ayu Mirage, Subliminal, nord
config.color_scheme = "duskfox"
-- tab bar
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 32
config.window_frame = {
    font = wezterm.font("CozetteVector"),
    font_size = 8.0,
    active_titlebar_bg = '#232136',
    inactive_titlebar_bg = '#232136',
}
config.colors = {
    tab_bar = {
            background = "#232136",
        active_tab = { bg_color = "#2d2a45", fg_color = "#ff87e5" },
        inactive_tab = { bg_color = "#201932", fg_color = "#5c7d9a" },
            inactive_tab_hover = { bg_color = "#373354", fg_color = '#ff87e5', italic = false },
        new_tab = { bg_color = "#232136", fg_color = "#5c7d9a" },
            new_tab_hover = { bg_color = "#232136", fg_color = '#ff87e5', italic = false },
        },
}
-- key-bindigs
config.keys = {
    { key = '\'', mods = 'CTRL', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = '/', mods = 'CTRL', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'PageUp', mods = 'SHIFT', action = wezterm.action.ScrollByPage(-0.5) },
    { key = 'PageDown', mods = 'SHIFT', action = wezterm.action.ScrollByPage(0.5) },
}
-- mouse-bindings
-- set scrollwheel jumps to 3 lines per tick
config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    mods = 'NONE',
    action = act.ScrollByLine(-3),
  },
  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    mods = 'NONE',
    action = act.ScrollByLine(3),
  },
}

return config

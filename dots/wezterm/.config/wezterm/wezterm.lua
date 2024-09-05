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
-- see https://wezfurlong.org/wezterm/config/appearance.html#tab-bar-appearance-colors
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 32
config.window_frame = {
    font_size = 8.0,
    active_titlebar_bg = '#232136',
    inactive_titlebar_bg = '#232136',
}
config.colors = {
    tab_bar = {
        background = "#232136",
        active_tab = { bg_color = "#232136", fg_color = "#ff87e5" },
        inactive_tab = { bg_color = "#201932", fg_color = "#5c7d9a" },
        inactive_tab_hover = { bg_color = "#373354", fg_color = '#ff87e5', italic = false },
        new_tab = { bg_color = "#232136", fg_color = "#5c7d9a" },
        new_tab_hover = { bg_color = "#232136", fg_color = '#ff87e5', italic = false },
    },
    -- Colors for copy_mode
    -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
    -- 2. selection_* otherwise
    selection_bg = '#393552',  -- Black
    selection_fg = '#eb6f92',  -- Maroon
    copy_mode_active_highlight_bg = { AnsiColor = 'Black' },
    copy_mode_active_highlight_fg = { AnsiColor = 'Red' },
    copy_mode_inactive_highlight_bg = { AnsiColor = 'Maroon' },
    copy_mode_inactive_highlight_fg = { AnsiColor = 'Black' },
}
-- key-bindigs
config.keys = {
    -- panel navigation and resizing
    { key = '-', mods = 'SUPER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = '-', mods = 'SUPER|CTRL', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = '/', mods = 'SUPER', action = wezterm.action.CloseCurrentPane{ confirm = false } },
    { key = '[', mods = 'SUPER', action = wezterm.action.ActivatePaneDirection('Prev') },
    { key = ']', mods = 'SUPER', action = wezterm.action.ActivatePaneDirection('Next') },
    { key = '[', mods = 'SUPER|CTRL', action = act.AdjustPaneSize{ 'Left', 1 } },
    { key = ']', mods = 'SUPER|CTRL', action = act.AdjustPaneSize{ 'Right', 1 } },
    { key = '[', mods = 'SUPER|ALT|CTRL', action = act.AdjustPaneSize{ 'Up', 1 } },
    { key = ']', mods = 'SUPER|ALT|CTRL', action = act.AdjustPaneSize{ 'Down', 1 } },
    -- scroll behaviour
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

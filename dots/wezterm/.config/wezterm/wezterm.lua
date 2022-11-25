local wezterm = require 'wezterm'
return {
    -- updates
    check_for_updates = false,
    -- scrollback
    scrollback_lines = 8000,
    -- padding
    window_padding = {
        left = '2cell',
        right = '2cell',
        top = '1cell',
        bottom = '1cell',
    },
    -- font settings
    font = wezterm.font("JetBrains Mono"),
    custom_block_glyphs = false,
    -- Whimsy, tokyonight, lovelace, Firewatch, Ayu Mirage, Subliminal, nord
    color_scheme = "duskfox",
    -- tab bar
    use_fancy_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    tab_max_width = 32,
    window_frame = {
        font = wezterm.font("CozetteVector"),
        font_size = 8.0,
        active_titlebar_bg = '#232136',
        inactive_titlebar_bg = '#232136',
    },
    colors = {
        tab_bar = {
	        background = "#232136",
            active_tab = { bg_color = "#2d2a45", fg_color = "#ff87e5" },
            inactive_tab = { bg_color = "#201932", fg_color = "#5c7d9a" },
	        inactive_tab_hover = { bg_color = "#373354", fg_color = '#ff87e5', italic = false },
            new_tab = { bg_color = "#232136", fg_color = "#5c7d9a" },
	        new_tab_hover = { bg_color = "#232136", fg_color = '#ff87e5', italic = false },
	    },
    },
    -- key-bindigs
    keys = {
        { key = '\'', mods = 'CTRL', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        { key = '/', mods = 'CTRL', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    },
}

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
    color_scheme = "Subliminal",
    -- tab bar
    use_fancy_tab_bar = false,
    colors = {
        tab_bar = {
	    background = "#302937",
            active_tab = { bg_color = "#433757", fg_color = "#ff87e5" },
            inactive_tab = { bg_color = "#302937", fg_color = "#5c7d9a" },
	    inactive_tab_hover = { bg_color = "#302937", fg_color = '#ff87e5', italic = false },
            new_tab = { bg_color = "#302937", fg_color = "#5c7d9a" },
	    new_tab_hover = { bg_color = "#302937", fg_color = '#ff87e5', italic = false },
	},
    },
    -- key-bindigs
    keys = {
        { key = '\'', mods = 'CTRL', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        { key = '/', mods = 'CTRL', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    },
}

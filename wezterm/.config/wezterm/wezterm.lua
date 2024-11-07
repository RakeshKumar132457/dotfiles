local wezterm = require 'wezterm';

return {
    enable_tab_bar = false,
    font = wezterm.font("Iosevka Term Nerd Font Mono"),
    default_prog = { "zellij" },
    font_size = 12.0,
    color_scheme = "Dracula",
    underline_position = '-8px',
    term = "xterm-256color",
    audible_bell = "Disabled"
}

local wezterm = require 'wezterm';

return {
    enable_tab_bar = false,
    font = wezterm.font("Iosevka Term Nerd Font Mono"),
    default_prog = { "tmux", "-2" },
    font_size = 13.0,
    color_scheme = "Dracula",
    underline_position = '-8px',
    term = "xterm-256color",
}

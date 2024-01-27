local wezterm = require 'wezterm';

return {
    font = wezterm.font("Iosevka Term Nerd Font Mono"),
    default_prog = { "tmux", "new", "-As0" },
    font_size = 13.0,
    color_scheme = "Dracula",
    underline_position = '-8px'
}

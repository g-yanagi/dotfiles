local wezterm = require("wezterm")

return {
  -- enable_tab_bar = false,
  font = wezterm.font("Migu 1M"),
  font_size = 20,

  color_scheme = "Darcula (base16)",

  window_background_opacity = 0.85,

  -- Enable mouse support in the terminal
  enable_mouse_mode = true,

  -- Enable copying text to the system clipboard on selection
  copy_on_select = true,

  visual_bell = {
    fade_in_duration_ms = 75,
    fade_out_duration_ms = 75,
    target = 'CursorColor',
  },

  audible_bell = 'Disabled',

  window_decorations = "RESIZE",

  window_frame = {
    border_left_width = '0.5cell',
    border_right_width = '0.5cell',
    border_bottom_height = '0.25cell',
    border_top_height = '0.25cell',
    border_left_color = 'purple',
    border_right_color = 'purple',
    border_bottom_color = 'purple',
    border_top_color = 'purple',
  },

  initial_cols = 220,
  initial_rows = 60,

}

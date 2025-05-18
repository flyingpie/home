-- Pull in the wezterm API.
local wezterm = require("wezterm")

local config = {}

-- Color scheme
config.color_scheme = "Rapture"

-- Font
config.font = wezterm.font("CaskaydiaMono Nerd Font", {weight="Regular", stretch="Normal", style="Normal"})
config.font_size = 9.0

-- Background
config.window_background_image = wezterm.home_dir .. "/.home/img/bg.png"
config.window_background_image_hsb = { brightness = 0.004 }

config.hide_tab_bar_if_only_one_tab = true

return config

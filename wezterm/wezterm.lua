-- Pull in the wezterm API.
local wezterm = require("wezterm")

local config = {}

config.color_scheme = "Neon Night (Gogh)"
config.color_scheme = "iTerm2 Smoooooth"

config.font = wezterm.font("CaskaydiaMono Nerd Font", {weight="Regular", stretch="Normal", style="Normal"})
config.font_size = 10.0

config.window_background_image = wezterm.home_dir .. "/.home/img/bg.png"
config.window_background_image_hsb = { brightness = 0.01 }

return config

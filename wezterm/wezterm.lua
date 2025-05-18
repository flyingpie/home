-- Pull in the wezterm API.
local wezterm = require("wezterm")

local config = {}

-- Color scheme
config.color_scheme = "Rapture"
-- config.color_scheme = "tokyonight_night"
-- config.color_scheme_dirs = { os.getenv("HOME") .. "/.home/wezterm/colors" }

-- Font
config.font = wezterm.font("CaskaydiaMono Nerd Font", {weight="Regular", stretch="Normal", style="Normal"})
config.font_size = 10.0

-- Background
config.window_background_image = wezterm.home_dir .. "/.home/img/bg.png"
config.window_background_image_hsb = { brightness = 0.002 }

config.hide_tab_bar_if_only_one_tab = true

return config

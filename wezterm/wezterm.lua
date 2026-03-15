-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = {}

-- Background
config.window_background_image = wezterm.home_dir .. "/.home/img/bg.png"
config.window_background_image_hsb = { brightness = 0.004 }

-- Color scheme
-- config.color_scheme = "Cloud (terminal.sexy)"
-- config.color_scheme = "Black Metal (Dark Funeral) (base16)"
-- config.color_scheme = "Blazer"
-- config.color_scheme = "Blue Matrix"
-- config.color_scheme = "carbonfox"
config.color_scheme = "Rapture"
-- config.color_scheme = "tokyonight_night"
-- config.color_scheme_dirs = { os.getenv("HOME") .. "/.home/wezterm/colors" }

-- Font
config.font = wezterm.font("CaskaydiaMono Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 9.0

-- Window
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "NONE"
config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = 8,
	bottom = 0,
}

return config

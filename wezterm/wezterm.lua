-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = {}

-- Background
config.background = {
	{
		-- source = { Color = "#171720" },
		source = { Color = "101016" },
		opacity = 1,
		height = "100%",
		width = '100%',
	},
	{
		source = { File = wezterm.home_dir .. "/.home/img/bg-12.jpg" },
		opacity = 0.03
	},
}


-- Color scheme
config.color_scheme = "Rapture"

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

-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = {}

-- Background
local bgIdx = math.random(1, 15)
local bgImg = string.format("/.home/img/bg-%02d.jpg", bgIdx)

config.background = {
	{
		source = { Color = "#101016" },
		opacity = 1,
		height = "100%",
		width = "100%",
	},
	{
		source = { File = wezterm.home_dir .. "/.home/img/bg-14.jpg" },
		-- source = { File = wezterm.home_dir .. bgImg },
		opacity = 0.025,
	},
}

-- Color scheme
config.color_scheme = "Rapture"

-- Font
config.font = wezterm.font("CaskaydiaMono Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 13.0

-- Window
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "NONE"

return config

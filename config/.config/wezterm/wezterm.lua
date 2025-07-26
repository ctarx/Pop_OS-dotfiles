local wezterm = require("wezterm")
local config = {}

-- General
config.enable_wayland = false
config.window_decorations = "NONE"
config.enable_tab_bar = false
config.window_background_opacity = 0.90
config.window_padding = { left = 12, right = 12, top = 10, bottom = 10 }

-- Env
config.set_environment_variables = {
	TERM = "xterm-256color",
}

-- Scrollback
config.scrollback_lines = 10000

-- Bell
config.audible_bell = "Disabled"
config.visual_bell = {
	fade_in_function = "Linear",
	fade_out_function = "Linear",
	fade_in_duration_ms = 20,
	fade_out_duration_ms = 20,
}

-- Keybindings
config.keys = {
	{ key = "F11", mods = "", action = wezterm.action.ToggleFullScreen },
	{ key = "V", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "C", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
}

-- Mouse
config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "",
		action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
	},
}

-- Cursor
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 60
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "EaseIn"
config.cursor_blink_ease_out = "EaseOut"
config.force_reverse_video_cursor = false

-- Font
config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font Mono", weight = "Regular", italic = false },
})
config.font_size = 14.0

-- Colorscheme
config.color_scheme = "GruvboxDark"

-- Override cursor color
config.colors = {
	cursor_bg = "#cc241d",
	cursor_fg = "#282828",
}

return config

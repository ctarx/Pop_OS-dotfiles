local wezterm = require("wezterm")

return {
	-- GENERAL --------------------------------------------------------
	enable_wayland = false,
	automatically_reload_config = true,

	-- ENVIRONMENT ----------------------------------------------------
	set_environment_variables = {
		TERM = "xterm-256color",
	},

	-- WINDOW ---------------------------------------------------------
	window_decorations = "NONE",
	enable_tab_bar = false,
	window_background_opacity = 0.90,
	window_padding = {
		left = 12,
		right = 12,
		top = 10,
		bottom = 10,
	},

	-- SCROLLBACK -----------------------------------------------------
	scrollback_lines = 10000,

	-- BELL -----------------------------------------------------------
	audible_bell = "Disabled",
	visual_bell = {
		fade_in_function = "Linear",
		fade_out_function = "Linear",
		fade_in_duration_ms = 20,
		fade_out_duration_ms = 20,
	},

	-- KEYBINDINGS ----------------------------------------------------
	keys = {
		{ key = "F11", action = wezterm.action.ToggleFullScreen },
	},

	-- MOUSE BINDINGS -------------------------------------------------
	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "",
			action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
		},
	},

	-- CURSOR ---------------------------------------------------------
	default_cursor_style = "BlinkingBlock",
	cursor_blink_rate = 750,
	cursor_thickness = 0.15,

	-- MOUSE ----------------------------------------------------------
	hide_mouse_cursor_when_typing = false,

	-- FONT -----------------------------------------------------------
	font = wezterm.font_with_fallback({
		{ family = "JetBrainsMono Nerd Font Mono", weight = "Regular", italic = false },
	}),
	font_size = 14.0,

	-- COLORS ---------------------------------------------------------
	colors = {
		foreground = "#ebdbb2",
		background = "#282828",

		cursor_bg = "#cc241d",
		cursor_fg = "#282828",

		ansi = {
			"#282828",
			"#cc241d",
			"#98971a",
			"#d79921",
			"#458588",
			"#b16286",
			"#689d6a",
			"#a89984",
		},
		brights = {
			"#928374",
			"#fb4934",
			"#b8bb26",
			"#fabd2f",
			"#83a598",
			"#d3869b",
			"#8ec07c",
			"#ebdbb2",
		},
	},
}

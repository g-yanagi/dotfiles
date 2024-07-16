local wezterm = require("wezterm")
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = "#0b0022"
	local background = "#1b1032"
	local foreground = "#808080"

	if tab.is_active then
		background = "#2b2042"
		foreground = "#c0c0c0"
	elseif hover then
		background = "#3b3052"
		foreground = "#909090"
	end

	local edge_foreground = background

	local title = tab_title(tab)
	local tab_number = tostring(tab.tab_index + 1)
	title = "  #" .. tab_number .. " "

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 2)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

return {
	-- enable_tab_bar = false,
	-- font = wezterm.font("Migu 1M"),
	-- font = wezterm.font("CommitMono"),
	-- font = wezterm.font("HackGen"),
	-- font = wezterm.font("Fira Code"),
	font = wezterm.font("UDEV Gothic NF"),
	font_size = 18,

	-- color_scheme = "Darcula (base16)",
	color_scheme = "iceberg-dark",

	--- window_background_opacity = 0.85,

	-- Enable mouse support in the terminal
	-- enable_mouse_mode = true,

	-- Enable copying text to the system clipboard on selection
	-- copy_on_select = true,

	visual_bell = {
		fade_in_duration_ms = 75,
		fade_out_duration_ms = 75,
		target = "CursorColor",
	},

	audible_bell = "Disabled",

	window_decorations = "RESIZE",

	window_frame = {
		border_left_color = "#6272a4",
		border_right_color = "#6272a4",
		border_bottom_color = "#6272a4",
		border_top_color = "#6272a4",
		border_left_width = "0.0cell",
		border_right_width = "0.0cell",
		border_bottom_height = "0.0cell",
		border_top_height = "0.0cell",
	},

	initial_cols = 220,
	initial_rows = 60,

	use_fancy_tab_bar = false,
	tab_max_width = 20,
}

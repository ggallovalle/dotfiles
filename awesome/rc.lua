-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

local globals = require("globals")
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

local xrandr = require("xrandr")
local battery_widget = require("awesome-wm-widgets.battery-widget.battery")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
local spotify_widget = require("awesome-wm-widgets.spotify-widget.spotify")
local docker_widget = require("awesome-wm-widgets.docker-widget.docker")
local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
local runonce = require("runonce")

local os = os
local type = type
local tostring = tostring

_ENV = nil

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if globals.awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = globals.awesome.startup_errors,
	})
end

-- Handle runtime errors after startup
do
	local in_error = false
	globals.awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})
		in_error = false
	end)
end
-- END Error handling }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- This is used later as the default terminal and editor to run.
local terminal = os.getenv("TERM") or "kitty"
local editor = os.getenv("EDITOR") or "nano"
local editor_cmd = terminal .. " -e " .. editor
-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
local modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
-- awful.layout.suit.fair.horizontal,
-- awful.layout.suit.spiral,
-- awful.layout.suit.spiral.dwindle,
awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.fair,
	awful.layout.suit.magnifier,
	awful.layout.suit.max,
}

-- beautiful.hotkeys_bg = "#050505"
-- beautiful.hotkeys_label_bg = "#050505"
beautiful.hotkeys_label_fg = "#ffffff"
beautiful.hotkeys_modifiers_fg = "#ffffff"
beautiful.hotkeys_font = "Product Sans 14"
beautiful.hotkeys_description_font = "Product Sans 12"
-- END Variable definitions }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
local myawesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. globals.awesome.conffile },
	{ "restart", globals.awesome.restart },
	{
		"quit",
		function()
			globals.awesome.quit()
		end,
	},
}

local mymainmenu = awful.menu({
	items = {
		{ "awesome", myawesomemenu, beautiful.awesome_icon },
		{ "open terminal", terminal },
	},
})

local mylauncher = awful.widget.launcher({
	image = beautiful.awesome_icon,
	menu = mymainmenu,
})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- END Menu }}}

-- Keyboard map indicator and switcher
local mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if globals.client.focus then
			globals.client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if globals.client.focus then
			globals.client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
	end)
)

local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == globals.client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
globals.screen.connect_signal("property::geometry", set_wallpaper)

local mytextclock = wibox.widget.textclock()
local cw = calendar_widget({ placement = "top_right" })
mytextclock:connect_signal("button::press", function(_, _, _, button)
	if button == 1 then
		cw.toggle()
	end
end)
awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	awful.spawn.with_shell("nitrogen --restore")
	-- set_wallpaper(s)

	-- Each screen has its own tag table.
	awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	})

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
	})

	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s })

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			mylauncher,
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			spotify_widget({
				dim_opacity = 0.5,
				dim_when_paused = true,
				max_length = 30,
				play_icon = "/usr/share/icons/Papirus-Light/24x24/categories/spotify.svg",
				pause_icon = "/usr/share/icons/Papirus-Dark/24x24/panel/spotify-indicator.svg",
			}),
			docker_widget(),
			brightness_widget(),
			battery_widget(),
			volume_widget(),
			mykeyboardlayout,
			wibox.widget.systray(),
			mytextclock,
			s.mylayoutbox,
		},
	})
end)
-- END Wibar }}}

-- {{{ Mouse bindings
globals.root.buttons(gears.table.join(
	awful.button({}, 3, function()
		mymainmenu:toggle()
	end),
	awful.button({}, 4, awful.tag.viewnext),
	awful.button({}, 5, awful.tag.viewprev)
))
-- END Mouse bindings }}}
-- {{{ Key bindings
-- Custom
local globalkeys = gears.table.join(
	awful.key({ modkey }, "d", function()
		awful.spawn.with_shell("rofi -show combi -combi-modi window,drun")
	end, {
		description = "show rofi",
		group = "hotkeys",
	}),
	awful.key({ modkey, "Shift" }, "q", function()
		awful.spawn.with_shell("rofi -show powermenu")
	end, {
		description = "rofi powermenu",
		group = "hotkeys",
	}),
	awful.key({}, "Print", function()
		awful.spawn.with_shell("flameshot gui")
	end, {
		description = "take screenshot",
		group = "hotkeys",
	})
)

-- Defaults
globalkeys = gears.table.join(
	globalkeys,
	awful.key({ modkey }, "s", hotkeys_popup.show_help, {
		description = "show help",
		group = "awesome",
	}),
	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, {
		description = "view next",
		group = "tag",
	}),
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),
	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(1)
	end, {
		description = "focus next by index",
		group = "client",
	}),
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end, {
		description = "focus previous by index",
		group = "client",
	}),
	awful.key({ modkey }, "w", function()
		mymainmenu:show()
	end, {
		description = "show main menu",
		group = "awesome",
	}),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(1)
	end, {
		description = "swap with next client by index",
		group = "client",
	}),
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(-1)
	end, {
		description = "swap with previous client by index",
		group = "client",
	}),
	awful.key({ modkey, "Control" }, "k", function()
		awful.screen.focus_relative(1)
	end, {
		description = "focus the next screen",
		group = "screen",
	}),
	awful.key({ modkey, "Control" }, "j", function()
		awful.screen.focus_relative(-1)
	end, {
		description = "focus the previous screen",
		group = "screen",
	}),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, {
		description = "jump to urgent client",
		group = "client",
	}),
	awful.key({ modkey }, "Tab", function()
		awful.client.focus.history.previous()
		if globals.client.focus then
			globals.client.focus:raise()
		end
	end, {
		description = "go back",
		group = "client",
	}),
	awful.key({ modkey }, "Return", function()
		awful.spawn(terminal)
	end, {
		description = "open a terminal",
		group = "hotkeys",
	}),
	awful.key({ modkey, "Control" }, "p", function()
		xrandr.xrandr()
	end, {
		description = "Arrange multipel screens",
		group = "awesome",
	}),
	awful.key(
		{ modkey, "Control" },
		"r",
		globals.awesome.restart,
		{ description = "reload awesome", group = "awesome" }
	),
	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, {
		description = "increase master width factor",
		group = "layout",
	}),
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, {
		description = "decrease master width factor",
		group = "layout",
	}),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, {
		description = "increase the number of master clients",
		group = "layout",
	}),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, {
		description = "decrease the number of master clients",
		group = "layout",
	}),
	awful.key({ modkey, "Control" }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, {
		description = "increase the number of columns",
		group = "layout",
	}),
	awful.key({ modkey, "Control" }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, {
		description = "decrease the number of columns",
		group = "layout",
	}),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, {
		description = "select next",
		group = "layout",
	}),
	awful.key({ modkey, "Shift" }, "space", function()
		awful.layout.inc(-1)
	end, {
		description = "select previous",
		group = "layout",
	}),
	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, {
		description = "restore minimized",
		group = "client",
	}),
	awful.key({ modkey }, "r", function()
		awful.screen.focused().mypromptbox:run()
	end, {
		description = "run prompt",
		group = "launcher",
	}),
	awful.key({ modkey }, "x", function()
		awful.prompt.run({
			prompt = "Run Lua code: ",
			textbox = awful.screen.focused().mypromptbox.widget,
			exe_callback = awful.util.eval,
			history_path = awful.util.get_cache_dir() .. "/history_eval",
		})
	end, {
		description = "lua execute prompt",
		group = "awesome",
	}),
	awful.key({ modkey }, "p", function()
		menubar.show()
	end, {
		description = "show the menubar",
		group = "launcher",
	})
)

local clientkeys = gears.table.join(
	awful.key({ modkey }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, {
		description = "toggle fullscreen",
		group = "client",
	}),
	awful.key({ modkey }, "q", function(c)
		c:kill()
	end, {
		description = "close",
		group = "client",
	}),
	awful.key(
		{ modkey, "Control" },
		"space",
		awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	),
	awful.key({ modkey, "Control" }, "Return", function(c)
		c:swap(awful.client.getmaster())
	end, {
		description = "move to master",
		group = "client",
	}),
	awful.key({ modkey }, "o", function(c)
		c:move_to_screen()
	end, {
		description = "move to screen",
		group = "client",
	}),
	awful.key({ modkey }, "t", function(c)
		c.ontop = not c.ontop
	end, {
		description = "toggle keep on top",
		group = "client",
	}),
	awful.key({ modkey }, "n", function(c)
		-- The client currently has the input focus, so it cannot be
		-- minimized, since minimized clients can't have the focus.
		c.minimized = true
	end, {
		description = "minimize",
		group = "client",
	}),
	awful.key({ modkey }, "m", function(c)
		c.maximized = not c.maximized
		c:raise()
	end, {
		description = "(un)maximize",
		group = "client",
	}),
	awful.key({ modkey, "Control" }, "m", function(c)
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, {
		description = "(un)maximize vertically",
		group = "client",
	}),
	awful.key({ modkey, "Shift" }, "m", function(c)
		c.maximized_horizontal = not c.maximized_horizontal
		c:raise()
	end, {
		description = "(un)maximize horizontally",
		group = "client",
	})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = gears.table.join(
		globalkeys,
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, {
			description = "view tag #" .. i,
			group = "tag",
		}),
		awful.key({ modkey, "Control" }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, {
			description = "toggle tag #" .. i,
			group = "tag",
		}),
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if globals.client.focus then
				local tag = globals.client.focus.screen.tags[i]
				if tag then
					globals.client.focus:move_to_tag(tag)
				end
			end
		end, {
			description = "move focused client to tag #" .. i,
			group = "tag",
		}),
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if globals.client.focus then
				local tag = globals.client.focus.screen.tags[i]
				if tag then
					globals.client.focus:toggle_tag(tag)
				end
			end
		end, {
			description = "toggle focused client on tag #" .. i,
			group = "tag",
		})
	)
end

local clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

-- Set keys
globals.root.keys(globalkeys)
-- END Key bindings }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},
	{
		rule = { class = "Teams" },
		properties = {
			tag = "8",
			screen = 1,
		},
	},
	{
		rule = { class = "Spotify" },
		properties = {
			tag = "9",
			screen = 1,
			switchtotag = true,
		},
	},
	{
		rule = { class = "Marvin" },
		properties = {
			tag = "6",
			screen = 1,
		},
	},
	{
		rule = { class = "Notion" },
		properties = {
			tag = "7",
			screen = 1,
		},
	},
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	},
	{
		rule_any = { type = { "normal", "dialog" } },
		properties = { titlebars_enabled = true },
	},
}
-- END Rules }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
globals.client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then awful.client.setslave(c) end

	if globals.awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
globals.client.connect_signal("request::titlebars", function(c)
	-- buttons for the titlebar
	local buttons = gears.table.join(
		awful.button({}, 1, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.move(c)
		end),
		awful.button({}, 3, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.resize(c)
		end)
	)

	awful.titlebar(c):setup({
		{ -- Left
			awful.titlebar.widget.iconwidget(c),
			buttons = buttons,
			layout = wibox.layout.fixed.horizontal,
		},
		{ -- Middle
			{ -- Title
				align = "center",
				widget = awful.titlebar.widget.titlewidget(c),
			},
			buttons = buttons,
			layout = wibox.layout.flex.horizontal,
		},
		{ -- Right
			awful.titlebar.widget.floatingbutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.stickybutton(c),
			awful.titlebar.widget.ontopbutton(c),
			awful.titlebar.widget.closebutton(c),
			layout = wibox.layout.fixed.horizontal(),
		},
		layout = wibox.layout.align.horizontal,
	})
end)

-- Enable sloppy focus, so that focus follows mouse.
globals.client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

globals.client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
end)
globals.client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
end)
-- END Signals }}}

-- {{{ Autostart
-- awful.spawn.with_shell("picom")
-- awful.spawn.with_shell("bluetoothctl power on")
-- awful.spawn.with_shell("copyq")
-- awful.spawn.with_shell("flameshot")
runonce.run("picom")
runonce.run("bluetoothctl power on")
runonce.run("copyq")
-- runonce.run("flameshot")
-- @see https://wiki.archlinux.org/title/Touchpad_Synaptics#Using_xinput_to_determine_touchpad_capabilities
-- enable natural scrolling and click on tap
runonce.run('xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Tapping Enabled" 1')
runonce.run(' xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Natural Scrolling Enabled" 1')
-- awful.spawn.with_shell("xmodmap ~/.xmodmaprc")
-- END Autostart }}}

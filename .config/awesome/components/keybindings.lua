local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
local naughty = require("naughty")

local config = require("components.config")
local mainmenu = require("components.mainmenu")
local wibar = require("components.wibar")

local runShell = require("awesome-wm-widgets.run-shell-3.run-shell")

-- Menubar configuration
-------------------------------------------------------------------------------
menubar.show_categories = true
menubar.cache_entries = true


-- Keybinding Configuration
-------------------------------------------------------------------------------
local keybindings = gears.table.join(
    awful.key({ config.modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ config.modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ config.modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ config.modkey,           }, "w", function () mainmenu.mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ config.modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ config.modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ config.modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ config.modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ config.modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ config.modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ config.modkey,           }, "Return", function () awful.spawn(config.terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ config.modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ config.modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ config.modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ config.modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ config.modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ config.modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ config.modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ config.modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ config.modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ config.modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ config.modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    --[[
    awful.key({ config.modkey },            "r",     function () awful.screen.focused().promptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ config.modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().promptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    --]]
    awful.key(
        { config.modkey }, "r",
        function ()
            runShell.launch()
        end,
        {
            description = "run prompt",
            group = "launcher"
        }
    ),
    -- Menubar
    awful.key({ config.modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),
    awful.key({ config.modkey }, "u", function() menubar.refresh() end,
              {description = "refresh the menubar", group = "launcher"}),
    -- Keyboard layout switch
    awful.key({ "Shift" }, "Alt_L", function () wibar.keyboardLayout.next_layout(); end,
              {description = "swap keyboard layout", group = "custom"}),
    -- Media volume control
    awful.key({ }, "XF86AudioMute",
              function ()
                  --awful.spawn("amixer -q -D pipewire sset Master 1+ toggle", false)
                  wibar.volumeWidget:toggle()
              end,
              {description = "toggle audio mute", group = "custom"}),
    awful.key({ }, "XF86AudioLowerVolume",
              function ()
                  --awful.spawn("amixer -q -D pipewire sset Master 2%-", false)
                  wibar.volumeWidget:dec(2)
              end,
              {description = "lower audio volume", group = "custom"}),
    awful.key({ }, "XF86AudioRaiseVolume",
              function ()
                  --awful.spawn("amixer -q -D pipewire sset Master 2%+", false)
                  wibar.volumeWidget:inc(2)
              end,
              {description = "raise audio volume", group = "custom"}),
    -- Media control
    awful.key({ }, "XF86AudioPrev",
              function ()
                  awful.spawn("playerctl previous", false)
              end,
              {description = "previous active media", group = "custom"}),
    awful.key({ }, "XF86AudioNext",
              function ()
                  awful.spawn("playerctl next", false)
              end,
              {description = "forward active media", group = "custom"}),
    awful.key({ }, "Pause",
              function ()
                  awful.spawn("playerctl play-pause", false)
              end,
              {description = "play-pause active media", group = "custom"}),
    -- Screenshot
    awful.key({ }, "Print",
              function ()
                  awful.spawn("flameshot gui", false)
              end,
              {description = "launch screenshot utility", group = "custom"}),
    -- Brightness control
    awful.key({ }, "XF86MonBrightnessDown",
              function ()
                  awful.spawn("light -U 5", false)
              end,
              {description = "decrease brightness", group = "custom"}),
    awful.key({ }, "XF86MonBrightnessUp",
              function ()
                  awful.spawn("light -A 5", false)
              end,
              {description = "increase brightness", group = "custom"}),
    -- Trackpad control
    awful.key({ config.modkey, "Control" }, "t",
              function ()
                  local touchpadDeviceName = "ELAN0524:00 04F3:3215 Touchpad"
                  awful.spawn.easy_async_with_shell(string.format("xinput list-props '%s' | grep 'Device Enabled' | awk '{ print $NF }'", touchpadDeviceName), function(stdout)
                      local result = tonumber(stdout)
                      if result == 1 then
                          awful.spawn(string.format("xinput disable '%s'", touchpadDeviceName))
                          naughty.notify({title = "Touchpad State", text = "Touchpad disabled", timeout = 5})
                      elseif result == 0 then
                          awful.spawn(string.format("xinput enable '%s'", touchpadDeviceName))
                          naughty.notify({title = "Touchpad State", text = "Touchpad enabled", timeout = 5})
                      else
                          naughty.notify({title = "Touchpad State", text = "An error occurred changing touchpad state", timeout = 5})
                      end
                  end)
              end,
              {description = "Toggle On/Off touchpad", group = "custom"}),
    -- Turn off screen light
    awful.key({ config.modkey, "Control" }, "b",
              function ()
                  awful.spawn.easy_async_with_shell("sleep .5; xset dpms force off", function() end)
              end,
              {description = "Turn off screen", group = "custom"})
)

return keybindings

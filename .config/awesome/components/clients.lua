local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")
local config = require("components.config")

local clients = {}

clients.buttons = gears.table.join(
    awful.button(
        { }, 1,
        function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
        end
    ),
    awful.button(
        { config.modkey }, 1,
        function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.move(c)
        end
    ),
    awful.button(
        { config.modkey }, 3,
        function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.resize(c)
        end
    )
)

clients.keys = gears.table.join(
    awful.key(
        { config.modkey }, "f",
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {
            description = "toggle fullscreen",
            group = "client"
        }
    ),
    awful.key(
        { config.modkey, "Shift" }, "c",
        function(c)
            c:kill()
        end,
        {
            description = "close",
            group = "client"
        }
    ),
    awful.key(
        { config.modkey, "Control" }, "space",
        awful.client.floating.toggle,
        {
            description = "toggle floating",
            group = "client"
        }
    ),
    awful.key(
        { config.modkey, "Control" }, "Return",
        function(c)
            c:swap(awful.client.getmaster())
        end,
        {
            description = "move to master",
            group = "client"
        }
    ),
    awful.key(
        { config.modkey }, "o",
        function(c)
            c:move_to_screen()
        end,
        {
            description = "move to screen",
            group = "client"
        }
    ),
    awful.key(
        { config.modkey }, "t",
        function(c)
            c.ontop = not c.ontop
        end,
        {
            description = "toggle keep on top",
            group = "client"
        }
    ),
    awful.key(
        { config.modkey }, "n",
        function(c)
            c.minimized = true
        end,
        {
            description = "minimize",
            group = "client"
        }
    ),
    awful.key(
        { config.modkey }, "m",
        function(c)
            c.maximized = not c.maximized
            c:raise()
        end,
        {
            description = "(un)maximize",
            group = "client"
        }
    ),
    awful.key(
        { config.modkey, "Control" }, "m",
        function(c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end,
        {
            description = "(un)maximize vertically",
            group = "client"
        }
    ),
    awful.key(
        { config.modkey, "Shift" }, "m",
        function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end,
        {
            description = "(un)maximize horizontally",
            group = "client"
        }
    )
)

-- Signal function to execute when a new client appears.
client.connect_signal(
    "manage",
    function(c)
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- if not awesome.startup then awful.client.setslave(c) end

        if awesome.startup and not c.size_hints.user_position
          and not c.size_hints.program_position then
            -- Prevent clients from being unreachable after screen count changes.
            awful.placement.no_offscreen(c)
        end
    end
)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal(
    "request::titlebars",
    function(c)
        -- buttons for the titlebar
        local buttons = gears.table.join(
            awful.button(
                { }, 1,
                function()
                    c:emit_signal("request::activate", "titlebar", { raise = true })
                    awful.mouse.client.move(c)
                end
            ),
            awful.button(
                { }, 3,
                function()
                    c:emit_signal("request::activate", "titlebar", { raise = true })
                    awful.mouse.client.resize(c)
                end
            )
        )
        awful.titlebar(c) : setup {
            { -- Left
                awful.titlebar.widget.iconwidget(c),
                buttons = buttons,
                layout  = wibox.layout.fixed.horizontal
            },
            { -- Middle
                { -- Title
                    align = "center",
                    widget = awful.titlebar.widget.titlewidget(c)
                },
                buttons = buttons,
                layout = wibox.layout.flex.horizontal
            },
            { -- Right
                awful.titlebar.widget.floatingbutton (c),
                awful.titlebar.widget.maximizedbutton(c),
                --awful.titlebar.widget.stickybutton   (c),
                awful.titlebar.widget.ontopbutton    (c),
                awful.titlebar.widget.closebutton    (c),
                layout = wibox.layout.fixed.horizontal()
            },
            layout = wibox.layout.align.horizontal
        }
    end
)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal(
    "mouse::enter",
    function(c)
        c:emit_signal("request::activate", "mouse_enter", { raise = false })
    end
)

client.connect_signal(
    "focus",
    function(c)
        c.border_color = beautiful.border_focus
    end
)
client.connect_signal(
    "unfocus",
    function(c)
        c.border_color = beautiful.border_normal
    end
)


return clients

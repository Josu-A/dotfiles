local awful = require("awful")
local gears = require("gears")
local layouttext = require("my-widgets.layouttext")

local layouts = {}

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    --awful.layout.suit.max,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier
}

layouts.buttons = gears.table.join(
    awful.button(
        { }, 1,
        function ()
            awful.layout.inc(1)
        end
    ),
    awful.button(
        { }, 3,
        function ()
            awful.layout.inc(-1)
        end
    ),
    awful.button(
        { }, 4,
        function ()
            awful.layout.inc(1)
        end
    ),
    awful.button(
        { }, 5,
        function ()
            awful.layout.inc(-1)
        end
    )
)


local function update(widget, screen)
    local name = awful.layout.getname(awful.layout.get(screen))
    widget.markup = name
end

-- Create widget that displays the current layout
-- @param table args Widget options
-- @param string args.screen Screen to show the widget at
-- @param[opt="icon"] string args.type Type of the widget, either "icon" or "text"
-- @return widget The layout widget
layouts.widget = function (args)
    setmetatable(args, {__index={type="icon"}})
    local s, type =
        args["screen"] or args.s,
        args["type"] or args.type

    local layoutbox = nil

    if type == "icon" then
        layoutbox = awful.widget.layoutbox {
            screen = s,
            buttons = layouts.buttons,
        }
    elseif type == "text" then
        layoutbox = layouttext {
            screen = s,
            buttons = layouts.buttons,
        }
    end
    return layoutbox
end

return layouts

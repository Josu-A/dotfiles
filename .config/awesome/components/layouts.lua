local awful = require("awful")
local gears = require("gears")

local layouts = {}

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
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

layouts.widget = function (s)
    local layoutbox = awful.widget.layoutbox(s)
    layoutbox:buttons(layouts.buttons)
    return layoutbox
end

return layouts

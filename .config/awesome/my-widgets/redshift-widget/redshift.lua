local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local redshiftWidget = {}

local function worker(userArgs)
    local args = userArgs or {}

    local marginLeft = args.marginLeft or 0
    local marginRight = args.marginRight or 0

    local redValue = args.redValue or 3200

    redshiftWidget = wibox.widget{
        text = "RS",
        widget = wibox.widget.textbox
    }

    local redshiftButtons = gears.table.join(
        awful.button(
            { }, 1,
            function ()
                awful.spawn(string.format("redshift -P -O %d", redValue))
            end
        ),
        awful.button(
            { }, 3,
            function ()
                awful.spawn("redshift -x")
            end
        )
    )

    redshiftWidget:buttons(redshiftButtons)
    return wibox.container.margin(redshiftWidget, marginLeft, marginRight)
end

return setmetatable(redshiftWidget, { __call = function (_, ...) return worker(...) end })

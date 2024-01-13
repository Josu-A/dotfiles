local wibox = require("wibox")

local separatorWidget = {}

local function worker(userArgs)
    local args = userArgs or {}

    local marginLeft = args.marginLeft or 5
    local marginRight = args.marginRight or 5

    local separatorChar = args.separatorChar or "│"

    separatorWidget = wibox.widget {
        text = separatorChar,
        widget = wibox.widget.textbox
    }

    return wibox.container.margin(separatorWidget, marginLeft, marginRight)
end

return setmetatable(separatorWidget, {  __call = function (_, ...) return worker(...) end })

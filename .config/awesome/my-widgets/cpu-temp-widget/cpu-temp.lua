local wibox = require("wibox")
local watch = require("awful.widget.watch")

local cpuTempWidget = {}

local function worker(userArgs)
    local args = userArgs or {}

    local marginLeft = args.marginLeft or 0
    local marginRight = args.marginRight or 0

    local timeout = args.timeout or 10

    cpuTempWidget = wibox.widget{
        text = "",
        widget = wibox.widget.textbox
    }

    local colorMap = {
        [30] = '#368893',
        [60] = '#A5FF7F',
        [75] = '#BC2F1D',
        [math.huge] = '#FF891B'
    }

    local function colorizeTemp(temp)
        for threshold, color in pairs(colorMap) do
            if temp < threshold then
                return color
            end
        end
    end

    watch('sensors', timeout, function(widget, stdout)
        for line in stdout:gmatch('[^\r\n]+') do
            if line:match("temp1") then
                local words = {}
                for word in line:gmatch("%S+") do
                    table.insert(words, word)
                end
                local temp = string.match(words[2], "%d+")
                widget.markup = '<span foreground="' .. colorizeTemp(tonumber(temp)) .. '">' .. temp .. '°C</span>'
            end
        end
    end,
    cpuTempWidget
    )

    return wibox.container.margin(cpuTempWidget, marginLeft, marginRight)
end

return setmetatable(cpuTempWidget, {__call = function(_, ...) return worker(...) end })

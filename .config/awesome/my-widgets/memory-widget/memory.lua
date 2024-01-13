local wibox = require("wibox")
local timer = require("gears.timer")

local memoryWidget = {}

local function worker(userArgs)
    local args = userArgs or {}

    local marginLeft = args.marginLeft or 0
    local marginRight = args.marginRight or 0

    local memoryValues = {}
    local memoryFile = args.memoryFile or "/proc/meminfo"

    local memWidget = wibox.widget{
        text = "",
        widget = wibox.widget.textbox
    }

    local swapWidget = wibox.widget{
        text = "",
        widget = wibox.widget.textbox
    }

    memoryWidget = wibox.widget{
        wibox.container.margin(memWidget, nil, marginRight),
        swapWidget,
        layout = wibox.layout.fixed.horizontal
    }

    local function getMemory()
        local memory = {}

        local keyMapping = {
            MemTotal = "total",
            MemFree = "free",
            Buffers = "buf",
            Cached = "cache",
            SwapTotal = "swap",
            SwapFree = "swapf",
            SReclaimable = "srec"
        }

        local pattern = "([%a]+):[%s]+([%d]+).+"

        for line in io.lines(memoryFile) do
            local key, value = line:match(pattern)
            if key then
                local memoryValueGigas = math.floor(tonumber(value) / 2^10 + 0.5)
                local memoryKey = keyMapping[key]
                if memoryKey then
                    memory[memoryKey] = memoryValueGigas
                end
            end
        end
        return memory
    end

    timer {
        timeout = 10,
        call_now = true,
        autostart = true,
        callback = function ()
            memoryValues = getMemory()

            local used = memoryValues.total - memoryValues.free - memoryValues.buf - memoryValues.cache - memoryValues.srec
            local formattedUsed = string.format("%.2f", used / 2^10)
            used = tonumber(formattedUsed)

            local swapused = memoryValues.swap - memoryValues.swapf
            local formattedSwapused = string.format("%.2f", swapused / 2^10)
            swapused = tonumber(formattedSwapused)

            memWidget.text = string.format("Mem %.2f", used)
            swapWidget.text = string.format("Swap %.2f", swapused)
        end
    }
    return wibox.container.margin(memoryWidget, marginLeft, marginRight)
end

return setmetatable(memoryWidget, { __call = function(_, ...) return worker(...) end })

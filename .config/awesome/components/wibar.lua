local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

local layouts = require("components.layouts")
local mainmenu = require("components.mainmenu")
local tags = require("components.tags")
local tasks = require("components.tasks")

local cpuTempWidget = require("my-widgets.cpu-temp-widget.cpu-temp")
local memoryWidget = require("my-widgets.memory-widget.memory")
local redshiftWidget = require("my-widgets.redshift-widget.redshift")
local separatorWidget = require("my-widgets.separator-widget.separator")

local batteryWidget = require("awesome-wm-widgets.battery-widget.battery")
local brightnessWidget = require("awesome-wm-widgets.brightness-widget.brightness")
local calendarWidget = require("awesome-wm-widgets.calendar-widget.calendar")
local cpuWidget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local logoutMenuWidget = require("awesome-wm-widgets.logout-menu-widget.logout-menu")
local pacmanWidget = require("awesome-wm-widgets.pacman-widget.pacman")
local todoWidget = require("awesome-wm-widgets.todo-widget.todo")
local volumeWidget = require("awesome-wm-widgets.pactl-widget.volume")

local wiSeperatorWidth = 24

local widgets = {
    volumeWidget = volumeWidget,
    keyboardLayout = awful.widget.keyboardlayout(),
}

local calendar = calendarWidget {
    placement = "top_right"
}

local textClock = wibox.widget.textclock()
textClock:connect_signal(
    "button::press",
    function (_, _, _, button)
        if button == 1 then
            calendar:toggle()
        end
    end
)

local leftSideWibar = function (s) return {
    layout = wibox.layout.fixed.horizontal,
    spacing = wiSeperatorWidth,
    {
        layout = wibox.layout.fixed.horizontal,
        logoutMenuWidget {
            onlock = function ()
                awful.spawn.with_shell('light-locker-command -l')
            end
        },
        mainmenu.mylauncher,
    },
    wibox.container.margin(tags.widget(s), 0, wiSeperatorWidth),
} end

local middleSideWibar = function (s) return {
    layout = wibox.layout.flex.horizontal,
    tasks.widget(s),
} end

local mySeparatorShape = function (cr, width, height, arrow_depth)
    gears.shape.transform(gears.shape.powerline):translate(0, -0) (
        cr, 70, beautiful.wibar_height, -beautiful.wibar_height
    )
end

local rightSideWibar = function (s) return {
    layout = wibox.layout.fixed.horizontal,
    spacing = wiSeperatorWidth,
    --spacing_widget = {
    --    color  = beautiful.get().wibar_bg_4,
    --    shape  = mySeparatorShape,
    --    widget = wibox.widget.separator,
    --},
    {
        layout = wibox.layout.fixed.horizontal,
        wibox.widget.systray(),
    },
    {
        layout = wibox.layout.fixed.horizontal,
        widgets.volumeWidget{
            widget_type = 'arc'
        },
        brightnessWidget{
            type = 'icon_and_text',
            program = 'light',
            step = 2,
            base = 35,
            timeout = 1
        },
        redshiftWidget{
            marginLeft = 5,
            marginRight = 5,
            redValue = 2000
        },
    },
    {
        layout = wibox.layout.fixed.horizontal,
        memoryWidget{
            marginLeft = 3,
            marginRight = 3
        },
        cpuTempWidget{
            marginLeft = 3,
            marginRight = 3
        },
        cpuWidget{
            step_width = 1,
            step_spacing = 0
        },
        batteryWidget{
            show_current_level = true
        },
    },
    {
        layout = wibox.layout.fixed.horizontal,
        pacmanWidget {
            popup_bg_color = beautiful.get().bg_normal,
            polkit_agent_path = '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1'
        },
        todoWidget(),
        textClock,
        widgets.keyboardLayout,
        layouts.widget { screen = s, type = "text"}
    },
} end

awful.screen.connect_for_each_screen(function (s)
    s.wibar = awful.wibar{
        position = "top",
        screen = s,
    }
    s.wibar:setup {
        layout = wibox.layout.flex.horizontal,
        leftSideWibar(s),
        middleSideWibar(s),
        rightSideWibar(s),
    }
end)

return widgets

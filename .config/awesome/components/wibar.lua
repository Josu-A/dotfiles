local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local widgets = {}

local calendarWidget = require("awesome-wm-widgets.calendar-widget.calendar")
local logoutMenuWidget = require("awesome-wm-widgets.logout-menu-widget.logout-menu")
local tags = require("components.tags")
local tasks = require("components.tasks")
local separatorWidget = require("my-widgets.separator-widget.separator")
widgets.volumeWidget = require("awesome-wm-widgets.pactl-widget.volume")
local brightnessWidget = require("awesome-wm-widgets.brightness-widget.brightness")
local redshiftWidget = require("my-widgets.redshift-widget.redshift")
local memoryWidget = require("my-widgets.memory-widget.memory")
local cpuTempWidget = require("my-widgets.cpu-temp-widget.cpu-temp")
local cpuWidget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local batteryWidget = require("awesome-wm-widgets.battery-widget.battery")
local pacmanWidget = require("awesome-wm-widgets.pacman-widget.pacman")
local todoWidget = require("awesome-wm-widgets.todo-widget.todo")
local layouts = require("components.layouts")

widgets.keyboardLayout = awful.widget.keyboardlayout()

local textClock = wibox.widget.textclock()
local cW = calendarWidget{
    placement = "top_right"
}
textClock:connect_signal(
    "button::press",
    function (_, _, _, button)
        if button == 1 then
            cW:toggle()
        end
    end
)
--[[
local monthCalendar = awful.widget.calendar_popup.month()
monthCalendar:attach(
    textClock,
    "tr",
    { on_hover = true }
)
--]]

awful.screen.connect_for_each_screen(
    function (s)
        --[[
        s.promptbox = awful.widget.prompt{
            exe_callback = function (cmd)
                awful.spawn.with_shell('$SHELL --rcfile ~/.bashrc -i -c ' .. cmd)
            end
        }
        --]]
        s.wibar = awful.wibar{
            position = "top",
            screen = s
        }
        s.wibar:setup {
            layout = wibox.layout.align.horizontal,
            {
                layout = wibox.layout.fixed.horizontal,
                logoutMenuWidget{
                    onlock = function ()
                        awful.spawn.with_shell('light-locker-command -l')
                    end
                },
                tags.widget(s),
                --s.promptbox
            },
            tasks.widget(s),
            {
                layout = wibox.layout.fixed.horizontal,
                wibox.widget.systray(),
                separatorWidget(),
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
                separatorWidget(),
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
                separatorWidget(),
                pacmanWidget{
                    popup_bg_color = beautiful.get().bg_normal,
                    polkit_agent_path = '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1'
                },
                todoWidget(),
                textClock,
                widgets.keyboardLayout,
                layouts.widget(s)
            }
        }
    end
)

return widgets

-- Import standard awesome library
local awful = require("awful")
local gears = require("gears")

-- Returning table which contains a list of buttons to manage tasks and
-- a widget containing the tasklist itself.
local tasks = {
    buttons = nil,
    widget = nil,
}

-- {{{ Setup task buttons

tasks.buttons = gears.table.join(
    -- Left click minimizes/maximizes or changes focus
    awful.button(
        { }, 1,
        function(c)
            if c == client.focus then
                c.minimized = true
            else
                c:emit_signal(
                    "request::activate",
                    "tasklist",
                    { raise = true }
                )
            end
        end
    ),
    -- Right click shows a list of all tasks from all tags
    awful.button(
        { }, 3,
        function()
            awful.menu.client_list{
                theme = {
                    width = 250
                }
            }
        end
    ),
    -- Scroll down changes focus to next task
    awful.button(
        { }, 4,
        function()
            awful.client.focus.byidx(1)
        end
    ),
    -- Scroll up changes focus to previous task
    awful.button(
        { }, 5,
        function()
            awful.client.focus.byidx(-1)
        end
    )
)

-- }}}

--- {{{ Setup tasklist widget

-- Creates a tasklist widget on the passed screen
-- @param screen s The screen to draw the tasklist on
-- @return widget The tasklist widget
tasks.widget = function (s)
    local tasklist = awful.widget.tasklist{
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasks.buttons
    }
    return tasklist
end

--- }}}

return tasks

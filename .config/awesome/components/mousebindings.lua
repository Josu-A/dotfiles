local awful = require("awful")
local gears = require("gears")
local mainMenu = require("components.mainmenu")

root.buttons(
    gears.table.join(
        awful.button(
            { }, 3,
            function ()
                mainMenu.mymainmenu:toggle()
            end
        ),
        awful.button(
            { }, 4,
            awful.tag.viewnext
        ),
        awful.button(
            { }, 5,
            awful.tag.viewprev
        )
    )
)

local awful = require("awful")
local beautiful = require("beautiful")
local config = require("components.config")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
require("awful.hotkeys_popup.keys")

local mainmenu = {}

-- Create a launcher widget and a main menu
local myawesomemenu = {
    {
        "hotkeys",
        function()
            hotkeys_popup.show_help(nil, awful.screen.focused())
        end
    },
    {
        "manual",
        config.terminal .. " -e man awesome"
    },
    {
        "edit config",
        config.editor_cmd .. " " .. awesome.conffile
    },
    {
        "restart",
        awesome.restart
    },
    {
        "quit",
        function()
            awesome.quit()
        end
    },
}

mainmenu.mymainmenu = awful.menu{
    items = {
        {
            "awesome",
            myawesomemenu,
            beautiful.awesome_icon
        },
        {
            "open terminal",
            config.terminal
        }
    }
}

mainmenu.mylauncher = awful.widget.launcher{
    image = beautiful.awesome_icon,
    menu = mainmenu.mymainmenu
}

menubar.utils.terminal = config.terminal -- Set the terminal for applications that require it

return mainmenu

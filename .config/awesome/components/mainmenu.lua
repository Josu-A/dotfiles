local awful = require("awful")
local beautiful = require("beautiful")
local config = require("components.config")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
require("awful.hotkeys_popup.keys")
local freedesktop = require("freedesktop")

local mainmenu = {}

-- Create a main menu
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

-- Create a power menu
local HOME = os.getenv("HOME")
local POWER_ICON_DIR = HOME .. "/.config/awesome/awesome-wm-widgets/logout-menu-widget/icons/"
local mypowermenu = {
    {
        "Power off",
        function()
            awful.spawn.with_shell("shutdown now")
        end,
        POWER_ICON_DIR .. "power.svg",
    },
    {
        "Log out",
        function()
            awesome.quit()
        end,
        POWER_ICON_DIR .. "log-out.svg",
    },
    {
        "Lock",
        function()
            awful.spawn.with_shell("light-locker-command -l")
        end,
        POWER_ICON_DIR .. "lock.svg",
    },
    {
        "Reboot",
        function()
            awful.spawn.with_shell("reboot")
        end,
        POWER_ICON_DIR .. "refresh-cw.svg",
    },
    {
        "Suspend",
        function()
            awful.spawn.with_shell("systemctl suspend")
        end,
        POWER_ICON_DIR .. "moon.svg",
    },
    {
        "Hibernate",
        function()
            awful.spawn.with_shell("systemctl hibernate")
        end,
        POWER_ICON_DIR .. "moon.svg",
    },
}

-- Create a launcher widget
mainmenu.mymainmenu = freedesktop.menu.build({
    before = {
        { "Awesome", myawesomemenu, beautiful.awesome_icon },
        { "Power", mypowermenu, POWER_ICON_DIR .. "power_w.svg" },
    },
    after = {
        { "Open Terminal", config.terminal },
    },
    sub_menu = false, -- "Freedesktop",
})

mainmenu.mylauncher = awful.widget.launcher{
    image = beautiful.awesome_icon,
    menu = mainmenu.mymainmenu,
}

menubar.utils.terminal = config.terminal -- Set the terminal for applications that require it

return mainmenu

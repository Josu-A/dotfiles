-- Import standard awesome library
local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")

-- Import components
local config = require("components.config")

--[[ Desktop icons

local freedesktop = require("freedesktop")

local function set_desktop_icons(s)
    freedesktop.desktop.add_icons({
        screen = s,
        dir = "~/Desktop",
        showlabels = true,
        open_with = "xdg-open",
        baseicons = {
            [1] = {
                label = "This PC",
                icon = "computer",
                onclick = "computer://"
            },
            [2] = {
               label = "Home",
               icon = "user-home",
               onclick = os.getenv("HOME")
            },
            [3] = {
               label = "Trash",
               icon = "user-trash",
               onclick = "trash://"
            }
        },
        iconsize = { width = 16, height = 16 },
        labelsize = { width = 140, height = 20 },
        margin = { x = 20, y = 20 },
    })
end

awful.screen.connect_for_each_screen(set_desktop_icons)

--]]

-- {{{ Theme setup

local theme_path = string.format(
    "%s/.config/awesome/themes/%s/theme.lua",
    os.getenv("HOME"), config.theme
)
beautiful.init(theme_path)

-- }}}

-- {{{ Wallpaper setup

-- Sets the wallpaper on the passed screen
-- @param screen s The screen to draw the wallpaper on
local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)
awful.screen.connect_for_each_screen(set_wallpaper)

-- }}}

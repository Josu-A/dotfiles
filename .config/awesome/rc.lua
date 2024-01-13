-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local awful = require("awful")
local gears = require("gears")
require("awful.autofocus")
-- Notification library
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

require("components.errors")
require("components.rules")
require("components.theme")
local tags = require("components.tags")
require("components.wibar")
require("components.mousebindings")
local keybindings = require("components.keybindings")

root.keys(
    gears.table.join(
        keybindings,
        tags.globalkeys
    )
)

-- {{{ Autostart

-- This function will run once every time Awesome is started
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

run_once({ -- comma-separated entries
    "nm-applet", -- Network manager applet to systemtray
    "setxkbmap -layout 'us,es'", -- Set keyboard layouts
    "numlockx", -- Activate NumLock
    "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1;"  -- polkit agency to allow root passwordless printer configuration
})

-- This function implements the XDG autostart specification
--[[
awful.spawn.with_shell(
    'if (xrdb -query | grep -q "^awesome\\.started:\\strue$"); then exit; fi;' ..
    'xrdb -merge <<< "awesome.started:true";' ..
    -- list each of your autostart commands, followed by ; inside single quotes, followed by ..
    'dex --environment Awesome --autostart --search-paths "$XDG_CONFIG_DIRS/autostart:$XDG_CONFIG_HOME/autostart"'
    )
--]]

-- }}}

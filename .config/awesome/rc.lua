-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local awful = require("awful")
local gears = require("gears")
require("awful.autofocus")

-- {{{ Import components

require("components.errors")
require("components.rules")
require("components.theme")
require("components.wibar")
require("components.mousebindings")
local tags = require("components.tags")
local keybindings = require("components.keybindings")

-- }}}

-- {{{ Set root keybindings

root.keys(
    gears.table.join(
        keybindings,
        tags.globalkeys
    )
)

-- }}}

-- {{{ Autostart programs

-- This function will run once every time Awesome is started
-- @param table cmd_arr List of commands to run
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

-- This function implements the XDG autostart specification
awful.spawn.with_shell(
    'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
    'xrdb -merge <<< "awesome.started:true";' ..
    -- list each of your autostart commands, followed by ; inside single quotes, followed by ..
    'dex --environment Awesome --autostart --search-paths' ..
    '"${XDG_CONFIG_HOME:-$HOME/.config}/autostart:${XDG_CONFIG_DIRS:-/etc/xdg}/autostart";' ..
    'setxkbmap -layout "es";' .. -- Set keyboard layouts
    'numlockx on;' .. -- Activate NumLock
    'picom -b;' -- Run compositor in background
)

run_once({
    'nm-applet --indicator',-- Network manager applet to systemtray
    'udiskie -s', -- Run USB automounter and icon
    'blueman-applet', -- Run blueman bluetooth manager and icon
    --"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1;"  -- polkit agency to allow root passwordless printer configuration
})

-- }}}

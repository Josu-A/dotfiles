local awful = require("awful")
local gears = require("gears")
local config = require("components.config")

local tags = {}

tags.buttons = gears.table.join(
    awful.button(
        { }, 1,
        function (t)
            t:view_only()
        end
    ),
    awful.button(
        { config.modkey }, 1,
        function (t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end
    ),
    awful.button(
        { }, 3,
        awful.tag.viewtoggle
    ),
    awful.button(
        { config.modkey }, 3,
        function (t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end
    ),
    awful.button(
        { }, 4,
        function (t)
            awful.tag.viewnext(t.screen)
        end
    ),
    awful.button(
        { }, 5,
        function (t)
            awful.tag.viewprev(t.screen)
        end
    )
)

tags.globalkeys = gears.table.join(
    awful.key(
        { config.modkey }, "Left",
        awful.tag.viewprev,
        {
            description = "view previous",
            group = "tag"
        }
    ),
    awful.key(
        { config.modkey }, "Right",
        awful.tag.viewnext,
        {
            description = "view next",
            group = "tag"
        }
    ),
    awful.key(
        { config.modkey }, "Escape",
        awful.tag.history.restore,
        {
            description = "go back",
            group = "tag"
        }
    )
)

for i = 1, 7 do
    tags.globalkeys = gears.table.join(
        tags.globalkeys,
        awful.key(
            { config.modkey }, "#" .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            {
                description = "view tag #i",
                group = "tag"
            }
        ),
        awful.key(
            { config.modkey, "Control" }, "#" .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            {
                description = "toggle tag #i",
                group = "tag"
            }
        ),
        awful.key(
            { config.modkey, "Shift" }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            {
                description = "move focused client to tag #i",
                group = "tag"
            }
        ),
        awful.key(
            { config.modkey, "Control", "Shift" }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            {
                description = "toggle focused client on tag #i",
                group = "tag"
            }
        )
    )
end

tags.widget = function (s)
    awful.tag(
        config.tag_names,
        s,
        awful.layout.layouts[1]
    )
    local taglist = awful.widget.taglist{
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = tags.buttons
    }
    return taglist
end

return tags

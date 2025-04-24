-- Import standard awesome library
local awful = require("awful")
local gears = require("gears")

-- Import components
local config = require("components.config")

-- Returning table which contains a list of buttons to manage tags, a list of 
-- keys to manage them and a widget containing the taglist itself.
local tags = {
    buttons = nil,
    globalkeys = nil,
    widget = nil,
}

-- {{{ Setup tags buttons

tags.buttons = gears.table.join(
    -- Left click a tag to show only tasks in it
    awful.button(
        { }, 1,
        function (t)
            t:view_only()
        end
    ),
    -- Super + Left click to move task into the clicked tag
    awful.button(
        { config.modkey }, 1,
        function (t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end
    ),
    -- Right click a tag to toggle visibility of tasks in it
    awful.button(
        { }, 3,
        awful.tag.viewtoggle
    ),
    -- Super + Right click to copy a task into the clicked tag
    awful.button(
        { config.modkey }, 3,
        function (t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end
    ),
    -- Scroll down to view tasks in next tag
    awful.button(
        { }, 4,
        function (t)
            awful.tag.viewnext(t.screen)
        end
    ),
    -- Scroll up to view tasks in previous tag
    awful.button(
        { }, 5,
        function (t)
            awful.tag.viewprev(t.screen)
        end
    )
)

-- }}}

-- {{{ Setup tag keys

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

for i = 1, #config.tag_names do
    tags.globalkeys = gears.table.join(
        tags.globalkeys,
        -- Super + tagId to show only tasks in it
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
        -- Super + Control + tagId to toggle visibility of tasks in it
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
        -- Super + Shift + tagId to move task into the pressed tag
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
        -- Super + Control + Shift + tagId to copy a task into the pressed tag
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

-- }}}

--- {{{ Setup taglist widget

-- Creates a taglist widget on the passed screen
-- @param screen s The screen to draw the taglist on
-- @return widget The taglist widget
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

-- }}}

return tags

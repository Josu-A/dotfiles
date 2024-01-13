local awful = require("awful")
local beautiful = require("beautiful")
local clients = require("components.clients")
local config = require("components.config")

awful.rules.rules = {
    -- All clients will match this rule
    {
        rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clients.keys,
            buttons = clients.buttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    },
    -- Floating clients
    {
        rule_any = {
            instance = {
                "DTA", -- Firefox addon DownThemAll
                "copyq", -- Includes session name in class
                "pinentry"
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin", -- kalarm
                "Sxiv",
                "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size
                "Wpa_gui",
                "veromix",
                "xtightvncviewer"
            },
            name = {
                "Event Tester" -- xev
            },
            role = {
                "AlarmWindow", -- Thunderbird's calendar
                "ConfigManager", -- Thunderbird's about:config
                "pop-up" -- e.g. Google Chrome's (detached) Developer Tools
            }
        },
        properties = {
            floating = true
        }
    },
    -- Add titlebars to normal clients and dialogs
    {
        rule_any = {
            type = {
                "normal",
                "dialog"
            }
        },
        properties = {
            titlebars_enabled = false
        }
    },
    -- Set browsers to always map on the corresponding tag
    {
        rule = {
            role = "browser"
        },
        properties = {
            screen = 1,
            tag = config.tag_names_dict["nav"]
        }
    },
    -- Set development applications to always map on the corresponding tag
    {
        rule_any = {
            class = {
                "Eclipse",
                "Code",
                "RStudio",
                "Texmaker",
                "oracle-ide-osgi-boot-OracleIdeLauncher" -- Oracle SQL Developer
            },
            name = {
                "Eclipse",
                "Oracle SQL Developer"
            }
        },
        properties = {
            screen = 1,
            tag = config.tag_names_dict["dev"]
        }
    },
    -- Set file managers to always map on the corresponding tag
    {
        rule = {
            class = "Nemo"
        },
        properties = {
            screen = 1,
            tag = config.tag_names_dict["files"]
        }
    },
    -- Set documents to always map on the corresponding tag
    {
        rule_any = {
            class = {
                "qpdfview",
                "StarUML"
            },
            name = {
                "LibreOffice"
            }
        },
        properties = {
            screen = 1,
            tag = config.tag_names_dict["docs"]
        }
    },
    -- Set media applications to always map on the corresponding tag
    {
        rule_any = {
            class = {
                "Audacity",
                "Ghb",
                "mpv",
                "obs",
                "steam",
                "vlc"
            },
            instance = {
                "guvcview"
            }
        },
        properties = {
            screen = 1,
            tag = config.tag_names_dict["media"]
        }
    },
    -- Set extra applications to corresponding tag
    {
        rule_any = {
            class = {
                "thunderbird",
                "discord",
                "Blender",
                "Gimp",
                "Inkscape",
                "krita",
                "TeamViewer",
                "KeePassXC"
            }
        },
        properties = {
            screen = 1,
            tag = config.tag_names_dict["other"]
        }
    }
}

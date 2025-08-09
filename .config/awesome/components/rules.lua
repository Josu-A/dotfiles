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
            type = {
                "dialog"
            },
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
                "Event Tester", -- xev
                "Compress" -- File Roller nemo compress interagration
            },
            role = {
                "AlarmWindow", -- Thunderbird's calendar
                "ConfigManager", -- Thunderbird's about:config
                "pop-up" -- e.g. Google Chrome's (detached) Developer Tools
            }
        },
        properties = {
            floating = true,
            placement = awful.placement.centered
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
    -- Set *BROWSERS* to always map on the corresponding tag
    {
        rule = {
            role = "browser"
        },
        properties = {
            screen = 1,
            tag = config.tag_names_dict["nav"]
        }
    },
    -- Set *DEVELOPMENT* applications to always map on the corresponding tag
    {
        rule_any = {
            class = {
                "Eclipse",
                "Code",
                "RStudio",
                "Texmaker",
                "oracle-ide-osgi-boot-OracleIdeLauncher", -- Oracle SQL Developer
                "QXmlEdit",
                "Qalculate-gtk",
            },
            name = {
                "Eclipse",
                "Oracle SQL Developer",
                "LTS Analyser",
            }
        },
        properties = {
            screen = 1,
            tag = config.tag_names_dict["dev"]
        }
    },
    -- Set *FILE MANAGERS* to always map on the corresponding tag
    {
        rule_any = {
            class = {
                "Nemo",
                "org.gnome.FileRoller",
            },
        },
        properties = {
            screen = 1,
            tag = config.tag_names_dict["files"]
        }
    },
    -- Set *DOCUMENTS* to always map on the corresponding tag
    {
        rule_any = {
            class = {
                "qpdfview",
                "StarUML",
                "xreader", "Xreader",
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
    -- Set *MEDIA* applications to always map on the corresponding tag
    {
        rule_any = {
            class = {
                "Audacity",
                "battle.net.exe",
                "Ghb",
                "Lutris",
                "mpv",
                "obs",
                "steam",
                "vlc"
            },
            instance = {
                "guvcview"
            },
            name = {
                "Hearthstone",
                "Hearthstone Deck Tracker",
            }
        },
        properties = {
            screen = 1,
            tag = config.tag_names_dict["media"]
        }
    },
    -- Set *EXTRA* applications to corresponding tag
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
                "Gucharmap",
                "font-viewer",
                "font-manager",
            }
        },
        properties = {
            screen = 1,
            tag = config.tag_names_dict["other"]
        }
    },
    -- Focus fix for HearthstoneDeckTracker
    {
        rule = {
            name = "Hearthstone Deck Tracker"
        },
        properties = {
            focus = false,
            --focusable = false,
            --urgent = false,
        }
    }
    --
}

awful.permissions.add_activate_filter(function (c) if c.name == "Hearthstone Deck Tracker" then return false end end, "permissions")

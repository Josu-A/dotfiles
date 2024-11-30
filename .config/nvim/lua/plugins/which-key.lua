return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 50,
        spec = {},
        notify = true,
        plugins = {
            marks = true,
            registers = true,
            spelling = {
                enabled = true,
                suggestions = 20,
            },
            presets = {
                operators = true, -- adds help for operators like d, y, ...
                motions = true, -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <c-w>
                nav = true, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true, -- bindings for prefixed with g
            },
        },
        win = {
            no_overlap = true, -- don't allow the popup to overlap with the cursor
            border = "double",
            padding = { 2, 4 }, -- extra window padding [top/bottom, right/left]
            title = true,
            title_pos = "center",
            zindex = 1000,
            -- Additional vim.wo and vim.bo options
            bo = {},
            wo = {
                winblend = 5, -- value between 0-100 0 for fully opaque and 100 for fully transparent
            },
        },
        layout = {
            width = { min = 20 }, -- min and max width of the columns
            spacing = 5, -- spacing between columns
        },
        keys = {
            scroll_down = "<C-d>", -- binding to scroll down inside the popup to Control+d
            scroll_up = "<C-u>", -- binding to scroll up inside the popup to Control+u
        },
        sort = { "local", "order", "group", "alphanum", "mod" },
        expand = 0, -- expand groups when <= n mappings
        show_help = true, -- show a help message in the command line for using WhichKey
        show_keys = true, -- show the currently pressed key and its label as a message in the command 
    },
    keys = {
        {
            "<Leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
            silent = true,
        },
    },
}

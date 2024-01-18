return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        local highlight = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowBlue",
            "RainbowOrange",
            "RainbowGreen",
            "RainbowViolet",
            "RainbowCyan"
        }

        local hooks = require("ibl.hooks")

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, highlight[1], { fg = "#E06C75" })
            vim.api.nvim_set_hl(0, highlight[2], { fg = "#E5C07B" })
            vim.api.nvim_set_hl(0, highlight[3], { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, highlight[4], { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, highlight[5], { fg = "#98C379" })
            vim.api.nvim_set_hl(0, highlight[6], { fg = "#C678DD" })
            vim.api.nvim_set_hl(0, highlight[7], { fg = "#56B6C2" })
        end)

        require("ibl").setup {
            indent = {
                highlight = highlight
            }
        }
    end
}

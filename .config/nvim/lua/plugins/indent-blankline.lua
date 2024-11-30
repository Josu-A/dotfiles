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
        local colors = {
            "#E06C75",
            "#E5C07B",
            "#61AFEF",
            "#D19A66",
            "#98C379",
            "#C678DD",
            "#56B6C2",
        }

        local hooks = require("ibl.hooks")

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            for i, v in ipairs(colors) do
                vim.api.nvim_set_hl(0, highlight[i], { fg = v })
            end
        end)

        require("ibl").setup({
            indent = {
                highlight = highlight,
            },
        })
    end
}

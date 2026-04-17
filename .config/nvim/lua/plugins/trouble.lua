return {
    "folke/trouble.nvim",
    build = "git apply ~/.config/nvim/patches/trouble-616.patch",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/which-key.nvim"
    },
    opts = {
        auto_open = false, -- automatically open the list when you have diagnostics
        auto_close = false, -- automatically close the list when you have no diagnostics
    },
    config = function()
        require("which-key").add({
            { "<Leader>t", group = "Trouble" },
        })
    end,
    keys = {
        {
            "<Leader>tx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Toggle trouble diagnostics",
            silent = true,
        },
        {
            "<Leader>tb",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Toggle buffer diagnostics",
            silent = true,
        },
        {
            "<Leader>tq",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Toggle quickfix",
            silent = true,
        },
        {
            "<Leader>tl",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Toggle location list",
            silent = true,
        },
        {
            "<Leader>tr",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "Toggle LSP references",
            silent = true,
        },
        {
            "<Leader>ts",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Toggle Symbols",
            silent = true,
        },
    },
}

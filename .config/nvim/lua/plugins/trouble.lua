return {
    "folke/trouble.nvim",
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
            function()
                require("trouble").toggle()
            end,
            desc = "Toggle trouble",
            silent = true,
        },
        {
            "<Leader>tw",
            function()
                require("trouble").toggle("workspace_diagnostics")
            end,
            desc = "Toggle workspace diagnostics",
            silent = true,
        },
        {
            "<Leader>td",
            function()
                require("trouble").toggle("document_diagnostics")
            end,
            desc = "Toggle document diagnostics",
            silent = true,
        },
        {
            "<Leader>tq",
            function()
                require("trouble").toggle("quickfix")
            end,
            desc = "Toggle quickfix",
            silent = true,
        },
        {
            "<Leader>tl",
            function()
                require("trouble").toggle("loclist")
            end,
            desc = "Toggle loclist",
            silent = true,
        },
        {
            "gR",
            function()
                require("trouble").toggle("lsp_references")
            end,
            desc = "Toggle LSP references",
            silent = true,
        },
    },
}

return {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/which-key.nvim"
    },
    config = function()

        -- load trouble
        require("trouble").setup {
            -- automatically open the list when you have diagnostics
            auto_open = false,
            -- automatically close the list when you have no diagnostics
            auto_close = false
        }

        -- set mappings for trouble
        local map = require("utils").map
        local toggle = require("trouble").toggle

        local register = require("which-key").register

        register({
            t = {
                name = "Trouble"
            }
        }, { prefix = "<Leader>" })

        map("n", "<Leader>tx", function() toggle() end, "Toggle trouble")
        map("n", "<Leader>tw", function() toggle("workspace_diagnostics") end, "Toggle workspace diagnostics")
        map("n", "<Leader>td", function() toggle("document_diagnostics") end, "Toggle document diagnostics")
        map("n", "<Leader>tq", function() toggle("quickfix") end, "Toggle quickfix")
        map("n", "<Leader>tl", function() toggle("loclist") end, "Toggle loclist")
        map("n", "gR", function() toggle("lsp_references") end, "Toggle lsp references")
    end
}

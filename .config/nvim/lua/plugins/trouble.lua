return {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()

        -- load trouble
        require("trouble").setup {
            -- automatically open the list when you have diagnostics
            auto_open = true,
            -- automatically close the list when you have no diagnostics
            auto_close = true
        }

        -- set mappings for trouble
        local map = require("utils").map
        map("n", "<Leader>xx", function() require("trouble").toggle() end, "Toggle trouble")
        map("n", "<Leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, "Toggle workspace diagnostics")
        map("n", "<Leader>xd", function() require("trouble").toggle("document_diagnostics") end, "Toggle document diagnostics")
        map("n", "<Leader>xq", function() require("trouble").toggle("quickfix") end, "Toggle quickfix")
        map("n", "<Leader>xl", function() require("trouble").toggle("loclist") end, "Toggle loclist")
        map("n", "gR", function() require("trouble").toggle("lsp_references") end, "Toggle lsp references")
    end
}

return {
    "tpope/vim-fugitive",
    event = "User InGitRepo",
    dependencies = {
        "folke/which-key.nvim"
    },
    opts = {},
    config = function()
        local map = require("config.utils").map
        require("which-key").add({
            { "<Leader>g", group = "Git" },
        })

        map("n", "<Leader>gs", "<cmd>Git<cr>", "Git status")
        map("n", "<Leader>gw", "<cmd>Gwrite<cr>", "Git add")
        map("n", "<Leader>gc", "<cmd>Git commit<cr>", "Git commit")
        map("n", "<Leader>gd", "<cmd>Gdiffsplit<cr>", "Git diff")
        map("n", "<Leader>gl", "<cmd>Git pull<cr>", "Git pull")
        map("n", "<Leader>gh", "<cmd>Git push<cr>", "Git push")
    end
}

return {
    "tpope/vim-fugitive",
    event = "User InGitRepo",
    dependencies = {
        "folke/which-key.nvim"
    },
    config = function()
        local map = require("utils").map
        local register = require("which-key").register

        register({
            g = {
                name = "Git"
            }
        }, { prefix = "<Leader>" })

        map("n", "<Leader>gs", "<cmd>Git<cr>", "Git status")
        map("n", "<Leader>gw", "<cmd>Gwrite<cr>", "Git add")
        map("n", "<Leader>gc", "<cmd>Git commit<cr>", "Git commit")
        map("n", "<Leader>gd", "<cmd>Gdiffsplit<cr>", "Git diff")
        map("n", "<Leader>gpl", "<cmd>Git pull<cr>", "Git pull")
        map("n", "<Leader>gph", "<cmd>Git push<cr>", "Git push")
    end
}

return {
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup {
            window = {
                border = "shadow"
            },
            layout = {
                align = "center"
            }
        }
    end
}

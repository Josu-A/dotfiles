return {
    "iamcco/markdown-preview.nvim",
    dependencies = {
        "folke/which-key.nvim"
    },
    cmd = {
        "MarkdownPreviewToggle",
        "MarkdownPreview",
        "MarkdownPreviewStop"
    },
    ft = {
        "markdown"
    },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    config = function()
        local map = require("utils").map
        local register = require("which-key").register

        register({
            p = {
                name = "Markdown Preview"
            }
        }, { prefix = "<Leader>" })

        map("n", "<Leader>mpb", "<cmd>MarkdownPreview<cr>", "Markdown Preview Begin")
        map("n", "<Leader>mps", "<cmd>MarkdownPreviewStop<cr>", "Markdown Preview Stop")
        map("n", "<Leader>mpt", "<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview Toggle")
    end
}

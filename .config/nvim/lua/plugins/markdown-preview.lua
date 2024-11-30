return {
    "iamcco/markdown-preview.nvim",
    dependencies = {
        "folke/which-key.nvim"
    },
    cmd = {
        "MarkdownPreviewToggle",
        "MarkdownPreview",
        "MarkdownPreviewStop",
    },
    ft = {
        "markdown",
    },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    opts = {},
    config = function()
        require("which-key").add({
            { "<Leader>m", group = "Markdown Preview" },
        })
        local map = require("config.utils").map
        map("n", "<Leader>mb", "<cmd>MarkdownPreview<cr>", "Markdown Preview Begin")
        map("n", "<Leader>ms", "<cmd>MarkdownPreviewStop<cr>", "Markdown Preview Stop")
        map("n", "<Leader>mt", "<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview Toggle")
    end,
}

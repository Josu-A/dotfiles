return {
    "iamcco/markdown-preview.nvim",
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
        map("n", "<Leader>mp", "<cmd>MarkdownPreview<cr>", "Markdown Preview")
        map("n", "<Leader>mps", "<cmd>MarkdownPreviewStop<cr>", "Markdown Preview Stop")
        map("n", "<Leader>mpt", "<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview Toggle")
    end
}

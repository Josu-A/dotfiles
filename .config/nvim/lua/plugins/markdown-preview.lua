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
    build = "cd app & npm install && git restore .",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
        vim.g.mkdp_browser = "/usr/bin/firefox"
        vim.g.mkdp_echo_preview_url = 1
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

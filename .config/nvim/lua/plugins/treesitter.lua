return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    opts = {
        -- A list of parser names, or "all"
        ensure_installed = {
            "bash",
            "c",
            "css",
            "csv",
            "dockerfile",
            "gitignore",
            "html",
            "java",
            "javascript",
            "json",
            "latex",
            "lua",
            "markdown",
            "php",
            "python",
            "query",
            "sql",
            "toml",
            "typescript",
            "vim",
            "vimdoc",
            "xml",
            "yaml"
        },

        -- Install parsers syncrhonously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to fase if you don't have `tree-sitter` CLI intalled locally
        auto_install = true,

        -- List of parsers to ignore installing (or "all")
        ignore_install = { },

        ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
        -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

        highlight = {
            enable = true,

            disable = { },

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        }
    },
}

local langs = {
    "ada",
    "bash", "bibtex",
    "c", "c_sharp", "cmake", "cpp", "css", "csv",
    "desktop", "diff", "dockerfile",
    "editorconfig",
    "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
    "go", "gpg",
    "haskell", "html",
    "java", "javascript", "json",
    "latex", "lua", "luadoc",
    "make", "markdown",
    "nginx",
    "php", "phpdoc", "powershell", "prisma", "pug", "python",
    "rust",
    "scss", "sql",
    "toml", "typescript", "tsx",
    "vim", "vimdoc",
    "xcompose", "xml",
    "yaml",
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })
        require('nvim-treesitter').install(langs)
        -- Treesitter highlighting
        vim.api.nvim_create_autocmd('FileType', {
            pattern = langs,
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
                if lang then
                    pcall(vim.treesitter.start, args.buf, lang)
                end
            end,
          --callback = function() vim.treesitter.start() end,
        })
    end,
}

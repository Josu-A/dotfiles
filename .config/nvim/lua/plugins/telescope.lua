return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = {
        -- Make sure to install `ripgrep` in OS
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable [[make]] == 1
            end
        },
        "folke/which-key.nvim",
    },
    opts = {},
    config = function()
        require("telescope").load_extension("fzf")
        require("which-key").add({
            { "<Leader>p", group = "Project" },
        })
    end,
    keys = {
        {
            "<Leader>pf",
            require("telescope.builtin").find_files,
            desc = "Find project files",
            silent = true,
        },
        {
            "<Leader>pg",
            require("telescope.builtin").git_files,
            desc = "Find project git scope files",
            silent = true,
        },
        {
            "<Leader>ps",
            require("telescope.builtin").live_grep,
            desc = "Search words inside project files",
            silent = true,
        },
        {
            "<Leader>pb",
            require("telescope.builtin").buffers,
            desc = "Find buffered files",
            silent = true,
        },
        {
            "<Leader>ph",
            require("telescope.builtin").help_tags,
            desc = "Find help tags",
            silent = true,
        }
    },
}

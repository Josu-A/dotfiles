return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
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
        "folke/which-key.nvim"
    },
    config = function()
        require("telescope").setup()
        require("telescope").load_extension("fzf")

        local builtin = require("telescope.builtin")
        local map = require("config.utils").map
        local register = require("which-key").register

        register({
            { "<Leader>p", group = "Project" },
        })

        -- mappings with <C-/> and ? in insert and normal mode respectively
        map("n", "<Leader>pf", builtin.find_files, "Find project files")
        map("n", "<Leader>pg", builtin.git_files, "Find project git scope files")
        map("n", "<Leader>ps", function()
            builtin.grep_string {
                search = vim.fn.input [[Grep > ]]
            }
        end, "Search words inside project files")
    end
}

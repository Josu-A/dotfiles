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
        }
    },
    config = function()
        require("telescope").setup()
        require("telescope").load_extension("fzf")

        local builtin = require("telescope.builtin")
        local utils = require("utils")
        local map = utils.map

        -- mappings with <C-/> and ? in insert and normal mode respectively
        map("n", "<Leader>pf", builtin.find_files, "Find files using Telescope")
        map("n", "<C-p>", builtin.git_files, "Find git scope files using Telescope")
        map("n", "<Leader>ps", function()
            builtin.grep_string {
                search = vim.fn.input [[Grep > ]]
            }
        end, "Search words inside the project using Telescope")
    end
}

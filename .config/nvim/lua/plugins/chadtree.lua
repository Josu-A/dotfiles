return {
    "ms-jpq/chadtree",
    branch = "chad",
    build = "python3 -m chadtree deps",
    event = "VeryLazy",
    keys = {
        {
            "<Leader>v",
            "<Cmd>CHADopen<Cr>",
            desc = "Toggle file viewer",
            silent = true,
        },
    },
    init = function ()
        local utils = require("config.utils")
        local create_augroup = utils.create_augroup
        local create_autocmd = utils.create_autocmd
        local auto_open_tree = create_augroup("auto_open_tree")
        create_autocmd({"BufRead", "BufNewFile"}, auto_open_tree, function()
            require("lazy").load({ plugins = { "chadtree" }})
            vim.cmd("CHADopen")
        end, "rc.lua")
    end
}

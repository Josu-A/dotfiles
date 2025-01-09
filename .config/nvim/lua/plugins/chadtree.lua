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
}

return {
    "laytan/cloak.nvim",
    event = "VeryLazy",
    opts = {
        enabled = true,
        cloak_character = "*",
        highlight_group = "Comment",
        cloak_length = nil,
        try_all_patterns = true,
        patterns = {
            {
                file_pattern = ".env*",
                cloak_pattern = "=.+",
                replace = nil
            }
        }
    }
}

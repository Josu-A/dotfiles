local utils = require("utils")
local map = utils.map
local create_augroup = utils.create_augroup
local create_autocmd = utils.create_autocmd
local wo = vim.wo

-- Highlight current line
local bg_highlight = create_augroup("BgHighlight")
local cursorline = wo.cursorline
create_autocmd("WinEnter", bg_highlight, function() cursorline = true end)
create_autocmd("WinLeave", bg_highlight, function() cursorline = false end)


-- Check if directory is a git repository
local git_repo_check = create_augroup("GitRepoCheck")
create_autocmd({ "VimEnter", "DirChanged" }, git_repo_check, function()
    local res = vim.fn.system("git rev-parse --is-inside-work-tree")
    if string.match(res, "true") then
        vim.api.nvim_exec_autocmds("User", { pattern = "InGitRepo" })
    end
end)

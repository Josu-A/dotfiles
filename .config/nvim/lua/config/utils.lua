local utils = {}

utils.merge_tables = function(tbl1, tbl2)
    if tbl2 == nil then
        return tbl1
    end
    for key, value in pairs(tbl2) do
        if type(value) == "table" then
            tbl1[key] = utils.merge_tables(tbl1[key], tbl2[key])
        else
            tbl1[key] = value
        end
    end
    return tbl1
end

utils.get_key_from_value = function(table, value)
    for k, v in pairs(table) do
        if v == value then
            return k
        end
    end
    return nil
end

utils.map = function(mode, lhs, rhs, description, opts)
    local default_options = {
        silent = true,
        desc = description
    }
    local options = utils.merge_tables(default_options, opts)
    vim.keymap.set(mode, lhs, rhs, options)
end

utils.create_augroup = function(group_name)
    vim.api.nvim_create_augroup(group_name, { clear = false })
end

utils.create_autocmd = function(event, group, callback, pattern)
    local opts = {
        group = group,
        callback = callback
    }
    if pattern then
        opts.pattern = pattern
    end
    vim.api.nvim_create_autocmd(event, opts)
end

return utils

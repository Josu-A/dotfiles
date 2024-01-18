-- List of configuration files to load
local conf_files = {
    "globals.lua",
    "options.lua",
    "mappings.lua",
    "autocommands.lua",
    "plugins.lua",
    "colors.lua"
}

-- Load specified modules
for _, file_name in ipairs(conf_files) do
    local module_name, _ = string.gsub(file_name, "%.lua", "")
    require(module_name)
end

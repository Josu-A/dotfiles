-- List of configuration files to load
local conf_files = {
    "globals.lua",
    "options.lua",
    "mappings.lua",
    "autocommands.lua",
    "lazy.lua",
    "colors.lua"
}
local conf_folder = "config."

-- Load specified modules
for _, file_name in ipairs(conf_files) do
    local module_name, _ = string.gsub(file_name, "%.lua", "")
    require(conf_folder .. module_name)
end

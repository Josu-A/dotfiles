local get_key_from_value = require("utils").get_key_from_value

local Schemes = {}

Schemes.colorschemes = {
    catppuccin_frappe = "catppuccin-frappe",
    catppuccin_latte = "catppuccin-latte",
    catppuccin_macchiato = "catppuccin-macchiato",
    catppuccin_mocha = "catppuccin-mocha",
    gruvbox = "gruvbox",
    kanagawa_dragon = "kanagawa-dragon",
    kanagawa_lotus = "kanagawa-lotus",
    kanagawa_wave = "kanagawa-wave",
    tokyonight_day = "tokyonight-day",
    tokyonight_moon = "tokyonight-moon",
    tokyonight_night = "tokyonight-night",
    tokyonight_storm = "tokyonight-storm"
}

Schemes.catppuccin_frappe = function()
    vim.cmd.colorscheme(Schemes.colorschemes.catppuccin_frappe)
end

Schemes.catppuccin_latte = function()
    vim.cmd.colorscheme(Schemes.colorschemes.catppuccin_latte)
end

Schemes.catppuccin_macchiato = function()
    vim.cmd.colorscheme(Schemes.colorschemes.catppuccin_macchiato)
end

Schemes.catppuccin_mocha = function()
    vim.cmd.colorscheme(Schemes.colorschemes.catppuccin_mocha)
end

Schemes.gruvbox = function()
    vim.cmd.colorscheme(Schemes.colorschemes.gruvbox)
end

Schemes.kanagawa_dragon = function()
    vim.cmd.colorscheme(Schemes.colorschemes.kanagawa_dragon)
end

Schemes.kanagawa_lotus = function()
    vim.cmd.colorscheme(Schemes.colorschemes.kanagawa_lotus)
end

Schemes.kanagawa_wave = function()
    vim.cmd.colorscheme(Schemes.colorschemes.kanagawa_wave)
end

Schemes.tokyonight_day = function()
    vim.cmd.colorscheme(Schemes.colorschemes.tokyonight_day)
end

Schemes.tokyonight_moon = function()
    vim.cmd.colorscheme(Schemes.colorschemes.tokyonight_moon)
end

Schemes.tokyonight_night = function()
    vim.cmd.colorscheme(Schemes.colorschemes.tokyonight_night)
end

Schemes.tokyonight_storm = function()
    vim.cmd.colorscheme(Schemes.colorschemes.tokyonight_storm)
end

local load_colorscheme = function(colorscheme, isTransparent)
    local scheme_name = colorscheme or "gruvbox"
    isTransparent = isTransparent or false

    local scheme_key = get_key_from_value(Schemes.colorschemes, scheme_name)
    local scheme = Schemes[scheme_key]
    if scheme == nil or type(scheme) ~= "function" then
        local msg = "Could not set " .. scheme_name .. " colorscheme."
        vim.notify(msg, vim.log.levels.ERROR, { title = "nvim config" })
        return
    end
    scheme()

    if isTransparent then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

load_colorscheme(Schemes.colorschemes.catppuccin_mocha, false)

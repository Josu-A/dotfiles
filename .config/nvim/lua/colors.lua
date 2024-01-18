local Schemes = {}

Schemes.colorschemes = {
    gruvbox = "gruvbox"
}

Schemes.gruvbox = function()
    vim.cmd [[ colorscheme gruvbox ]]
end

local load_colorscheme = function(colorscheme, isTransparent)
    local scheme_name = colorscheme or Schemes.colorschemes.gruvbox
    local isTransparent = isTransparent or false

    local scheme = Schemes[scheme_name]
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

load_colorscheme(Schemes.colorschemes.gruvbox, false)

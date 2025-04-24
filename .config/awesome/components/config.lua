local config = {}

config.theme    = "personal"
config.terminal = "alacritty"
config.editor = os.getenv("EDITOR") or "vim"
config.editor_cmd = config.terminal .. " -e " .. config.editor
config.modkey   = "Mod4"
config.altkey   = "Mod1"
config.tag_names = { "Files", "Nav", "Dev", "Docs", "Media", "Etc" }
config.tag_names_dict = {
    files = config.tag_names[1],
    nav = config.tag_names[2],
    dev = config.tag_names[3],
    docs = config.tag_names[4],
    media = config.tag_names[5],
    other = config.tag_names[6]
}

return config

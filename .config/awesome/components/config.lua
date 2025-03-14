local config = {}

config.theme    = "default"
config.terminal = "alacritty"
config.editor = os.getenv("EDITOR") or "vim"
config.editor_cmd = config.terminal .. " -e " .. config.editor
config.modkey   = "Mod4"
config.altkey   = "Mod1"
config.tag_names = { "📂", "🌐", "💻", "📃", "⌨️", "🎧", "🌀" }
config.tag_names_dict = {
    files = config.tag_names[1],
    nav = config.tag_names[2],
    dev = config.tag_names[3],
    docs = config.tag_names[4],
    term = config.tag_names[5],
    media = config.tag_names[6],
    other = config.tag_names[7]
}

return config

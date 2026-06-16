hl.workspace_rule({ workspace = "special:gjtv", gaps_out = 0, gaps_in = 0 })

hl.window_rule({
    name          = "gjtv-rules",
    match         = { class = "^(gjtv)$" },
    workspace     = "special:gjtv",
    fullscreen    = true,
    border_size   = 0,
    suppress_event = "maximize",
})

hl.bind("Home", hl.dsp.workspace.toggle_special("gjtv"))

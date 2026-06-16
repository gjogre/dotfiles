hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 5,

        border_size = 2,

        col = {
            active_border        = "rgb(800080)",
            inactive_border      = "rgba(44475aaa)",
            nogroup_border       = "rgba(282a36dd)",
            nogroup_border_active = { colors = { "rgb(bd93f9)", "rgb(44475a)" }, angle = 90 },
        },

        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding = 0,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = "rgba(1E202966)",
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },
})

local colors = dofile_or_value(cachePath.."hellwal/hyprland_colors.lua", {
    border1="#ffffff",
    border2="#ffffff"
})

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,

        border_size = 2,

        col = {
            active_border = {colors = {colors.border1, colors.border2}, angle = 45}, 
            inactive_border = "#595959aa",
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = "dwindle"
    },

    decoration = {
        rounding = 6,
        rounding_power = 2,

        active_opacity = .95,
        inactive_opacity = .85,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "#1a1a1aee",
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 3,
            vibrancy = 0.1696
        }
    }
})
------------------------
----- WINDOW RULES -----
------------------------
hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Full opacity for anything that isn't the new tab in firefox
hl.window_rule({
    name="firefox-opacity",
    match = {
        class = "^(firefox)$",
        title = "negative:^(Mozilla Firefox|New Tab — Mozilla Firefox)$"
    },
    opacity="1.0 override"
})

-- Things that should float

hl.window_rule({
    match={
        title = "^(Firefox - Choose User Profile)$"
    },
    float=true
})

hl.window_rule({
    match={
        class = "hyprland-share-picker"
    },
    float=true
})

hl.window_rule({
    match={
        class = "mpv"
    },
    float=true
})

hl.window_rule({
    match={
        class = "swayimg.+"
    },
    float=true
})

hl.window_rule({
    match={
        class = "floating"
    },
    float=true,
    center=true,
    size={"monitor_w*0.7","monitor_h*0.7"}
})

hl.window_rule({
    name="dragon-drop",
    match = {
        class="dragon-drop"
    },
    pin=true
})

------------------------
----- LAYER RULES ------
------------------------
hl.layer_rule({
    name="launcher-blur",
    match = {
        namespace = "launcher"
    },
    blur=true,
    ignore_alpha=0
})
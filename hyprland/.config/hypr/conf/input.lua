hl.config({
    input = {
        kb_layout  = "es",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({fingers=3, direction="horizontal",action="workspace"})
hl.gesture({fingers=3, direction="down",action="special",workspace_name="magic"})
hl.gesture({fingers=3, direction="up",action="special",workspace_name="megamagic"})
hl.gesture({fingers=4, direction="swipe",action="move"})
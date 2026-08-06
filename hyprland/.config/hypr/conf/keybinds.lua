local Programs = require("conf.programs")

local mainMod = "SUPER"
local resizeAmount = 50

-- Programs & menus
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(Programs.terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(Programs.fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(Programs.menu))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd(Programs.taskManager))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd(Programs.powerMenu))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(Programs.menuMenu))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(Programs.clipboardMenu))
hl.bind("Print", hl.dsp.exec_cmd(Programs.screenshot))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(Programs.screenshotClipboardOnly))

-- Window control
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", smart_float)
hl.bind(mainMod .. " + P", smart_pin)
hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.window.center())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({action="toggle"}))
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen_state({action="toggle", internal=1, client=1}))
-- Moving windows
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))
-- Resizing windows
hl.bind(mainMod .. " + ALT + left",  hl.dsp.window.resize({ x=-resizeAmount,y=0, relative = true }))
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.resize({ x=resizeAmount,y=0 , relative = true}))
hl.bind(mainMod .. " + ALT + up",    hl.dsp.window.resize({ x=0,y=-resizeAmount , relative = true}))
hl.bind(mainMod .. " + ALT + down",  hl.dsp.window.resize({ x=0,y=resizeAmount, relative = true }))

-- Move focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + TAB",   hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + SHIFT + TAB",   hl.dsp.window.cycle_next({ next = false }))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace=i,follow=false }))
end

-- Special workspaces
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:magic", follow=false }))
hl.bind(mainMod .. " + F2",         hl.dsp.workspace.toggle_special("megamagic"))
hl.bind(mainMod .. " + SHIFT + F2", hl.dsp.window.move({ workspace = "special:megamagic" }))
hl.bind(mainMod .. " + ALT + F2", hl.dsp.window.move({ workspace = "special:megamagic", follow=false }))

-- Scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + left", hl.dsp.focus({ workspace="e-1" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.focus({ workspace="e+1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })


-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
hl.bind(mainMod .. " + Delete", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(mainMod .. " + Prior", hl.dsp.exec_cmd("playerctl previous"))
hl.bind(mainMod .. " + Next", hl.dsp.exec_cmd("playerctl next"))

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("loginctl lock-session"))
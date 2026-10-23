hl.on("hyprland.start", function ()
    hl.exec_cmd("wl-paste --type text --watch cliphist store -max-items 20")
    hl.exec_cmd("wl-paste --type image --watch cliphist store -max-items 20")
    hl.exec_cmd("hyprpm reload")
    hl.exec_cmd(Globals.hyprScripts.."bluetooth-trusted.sh")
end)

hl.on("monitor.added", function ()
    hl.exec_cmd("systemctl --user restart awww-daemon")
end)

hl.on("window.open", function (window)
    for i,class in ipairs(Globals.horizontalWindowClasses) do
        if window.class == class then
            smart_split(window, 1.6)
        end
    end
end)
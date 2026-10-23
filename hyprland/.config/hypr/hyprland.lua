Globals = {
    cachePath = os.getenv("HOME") .. "/.cache/",
    scriptPath = os.getenv("HOME") .. "/scripts/",
    hyprScripts = os.getenv("HOME") .. "/.config/hypr/scripts/",
    shaderPath = os.getenv("HOME") .. "/.config/hypr/shaders/",
    horizontalWindowClasses = {"com.microsoft.VSCode"} -- Windows that will be split horizontally when opened
}

require("conf.utils")
require("conf.env")
require("conf.events")
require("conf.plugins")
require("conf.general")
require("conf.appearance")
require("conf.animations")
require("conf.keybinds")
require("conf.input")
require("conf.rules")

-- Added by hyprmoncfg: its generated monitor rules load last, so nothing before this can override the applied layout.
do local path = (os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config") .. "/hypr/hyprmoncfg-monitors.lua"; local file = io.open(path, "r"); if file then file:close(); dofile(path) end end

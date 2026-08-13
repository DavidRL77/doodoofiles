Globals = {
    cachePath = os.getenv("HOME") .. "/.cache/",
    scriptPath = os.getenv("HOME") .. "/scripts/",
    hyprScripts = os.getenv("HOME") .. "/.config/hypr/scripts/",
    shaderPath = os.getenv("HOME") .. "/.config/hypr/shaders/"
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
require("monitors") --hyprmoncfg
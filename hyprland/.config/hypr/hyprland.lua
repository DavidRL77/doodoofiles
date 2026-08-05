cachePath = os.getenv("HOME") .. "/.cache/"
scriptPath = os.getenv("HOME") .. "/scripts/"
hyprScripts = os.getenv("HOME") .. "/.config/hypr/scripts/"

require("conf.utils")
require("conf.env")
require("conf.programs")
require("conf.autostart")
require("conf.general")
require("conf.appearance")
require("conf.animations")
require("conf.keybinds")
require("conf.input")

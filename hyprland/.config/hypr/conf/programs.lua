return {
    terminal = "kitty",
    fileManager = "kitty --class floating -e yazi",
    taskManager = "kitty --class floating -e btop",
    menu = "fuzzel",
    powerMenu = Globals.scriptPath.."menus/power-menu.sh",
    menuMenu = Globals.scriptPath.."menus/menu-menu.sh",
    clipboardMenu = Globals.scriptPath.."menus/cliphist-fuzzel-img.sh",
    screenshot = "hyprshot -m region -o $(xdg-user-dir SCREENSHOTS)/ --freeze",
    screenshotClipboardOnly = "hyprshot -m region --clipboard-only --freeze"
}
function exit() 
	swayimg.exit()
end

function toggleText()
	swayimg.text.visible = swayimg.text.visible
end

function zoom(amount)
	swayimg.viewer.set_abs_scale(swayimg.viewer.scale+amount)
end

-- General
swayimg.overlay = true
swayimg.gallery.window_color = 0x00000000
swayimg.viewer.set_window_background(0x00000000)
swayimg.text.color = 0xffffffff
swayimg.text.visible = false

-- Info viewer position
swayimg.viewer.text = {
	["topleft"]={"{name}"}
}

-- Key bindings
swayimg.viewer.on_key("q", exit)
swayimg.viewer.on_key("i", toggleText)
swayimg.viewer.on_key("Ctrl-Left", function() swayimg.viewer.open("prev") end)
swayimg.viewer.on_key("Ctrl-Right", function() swayimg.viewer.open("next") end)
swayimg.viewer.on_key("Ctrl-Up", function() zoom(.1) end)
swayimg.viewer.on_key("Ctrl-Down", function() zoom(-.1) end)
swayimg.viewer.on_key("r", function() swayimg.viewer.rotate(90) end)
swayimg.viewer.on_key("Space", function() swayimg.viewer.reset() end)

swayimg.gallery.on_key("q", exit)
swayimg.gallery.on_key("i", toggleText)

-- Gallery key binding
swayimg.gallery.on_key("w", function()
  local image = swayimg.gallery.get_image()
  if image and image.path then
    os.execute(os.getenv("WALLPAPER_COMMAND") .. " " .. image.path)
  end
end)

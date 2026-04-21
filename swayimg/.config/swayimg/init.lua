function exit() 
	swayimg.exit()
end

function toggleText()
	if swayimg.text.visible() then
		swayimg.text.hide()
	else
		swayimg.text.show()
		swayimg.text.set_timeout(0)
	end
end

function zoom(amount)
	swayimg.viewer.set_abs_scale(swayimg.viewer.get_scale()+amount)
end

-- General
swayimg.enable_overlay(true)
swayimg.viewer.set_window_background(0x00000000)
swayimg.gallery.set_window_color(0x00000000)
swayimg.text.set_foreground(0xffffffff)
swayimg.text.hide();

-- Info viewer position
swayimg.viewer.set_text("topleft", {
  "{name}"
})

-- Key bindings
swayimg.viewer.on_key("q", exit)
swayimg.viewer.on_key("i", toggleText)
swayimg.viewer.on_key("Ctrl-Left", function() swayimg.viewer.switch_image("prev") end)
swayimg.viewer.on_key("Ctrl-Right", function() swayimg.viewer.switch_image("next") end)
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

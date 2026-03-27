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
swayimg.gallery.on_key("q", exit)
swayimg.gallery.on_key("i", toggleText)

-- Gallery key binding
swayimg.gallery.on_key("w", function()
  local image = swayimg.gallery.get_image()
  if image and image.path then
    os.execute(os.getenv("WALLPAPER_COMMAND") .. " " .. image.path)
  end
end)

function exit() 
	swayimg.exit()
end

function toggleText()
	swayimg.text.visible = !swayimg.text.visible
end

function zoom(amount)
	swayimg.viewer.set_abs_scale(swayimg.viewer.scale+amount)
end

function clamp(n, min, max)
	if n < min then
		return min
	elseif n > max then
		return max
	else
		return n
	end
end

function adjust_thumb_size()
	local size = swayimg.get_window_size()
	local padding = 0
	local area = (size.width - padding) * (size.height - padding)
	local n = swayimg.imagelist.size
	local thumb_size = tonumber(string.format("%.f", (area/n)^0.5))
	swayimg.gallery.thumb_size = clamp(thumb_size,200,800)
end

-- Open in gallery mode if more than one image is opened
swayimg.on_initialized(function()
	if swayimg.imagelist.size > 1 then
		swayimg.mode="gallery"
	end

	adjust_thumb_size()
end)

-- General
swayimg.overlay = true
swayimg.gallery.window_color = 0x00000000
swayimg.viewer.set_window_background(0x00000000)
swayimg.text.color = 0xffffffff
swayimg.text.visible = false
swayimg.text.size = 16
swayimg.gallery.padding_size=10
swayimg.viewer.text = {
	["topleft"]={"{name}"}
}
swayimg.gallery.text = {
	["topleft"]={"{name}"}
}

-- Key bindings
swayimg.viewer.on_key("q", exit)
swayimg.viewer.on_key("i", toggleText)
swayimg.viewer.on_key("Ctrl-Left", function() swayimg.viewer.open("prev") end)
swayimg.viewer.on_key("Ctrl-Right", function() swayimg.viewer.open("next") end)
swayimg.viewer.on_key("Ctrl-Up", function() zoom(.1) end)
swayimg.viewer.on_key("Ctrl-Down", function() zoom(-.1) end)
swayimg.viewer.on_key("Ctrl-plus", function() zoom(.1) end)
swayimg.viewer.on_key("Ctrl-minus", function() zoom(-.1) end)
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

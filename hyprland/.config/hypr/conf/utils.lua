--- Resize window based on percentage of monitor size
--- @param x integer
--- @param y integer
--- @param window any
function set_size_percentage(x,y, window)
    window = window or hl.get_active_window()

    local monitor = hl.get_active_monitor()
    if not monitor then return end

    local width = x / 100 * monitor.height
    local height = y / 100 * monitor.width

    hl.dispatch(hl.dsp.window.resize({x=height, y=width, relative=false,window=window}))
end

function smart_float(window)
    window = window or hl.get_active_window()
    hl.dispatch(hl.dsp.window.float({ action = "toggle", window=window}))
    if(window.floating) then
        set_size_percentage(50,50,window)
    end
    hl.dispatch(hl.dsp.window.center({window=window}))
end

---Checks if file exists before executing it, and returns its value or default_value if not
---@param file any
---@param default_value any
---@return any
function dofile_or_value(file, default_value) 
    if(not io.open(file, "r")) then return default_value end

    return dofile(file)
end
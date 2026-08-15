function debug_notify(value)
    hl.notification.create({text=tostring(value),timeout=5000})
end

function execute_and_return(cmd)
    local process = io.popen(cmd)
    if not process then return nil end

    local result = process:read("*a")
    process:close()

    return result
end

--- Resize window based on percentage of monitor size
--- @param x integer
--- @param y integer
--- @param window any
function set_size_percentage(x,y, window)
    window = window or hl.get_active_window()
    if not window then return end

    local monitor = hl.get_active_monitor()
    if not monitor then return end

    local width = x / 100 * monitor.height
    local height = y / 100 * monitor.width

    hl.dispatch(hl.dsp.window.resize({x=height, y=width, relative=false,window=window}))
end

function smart_float(window)
    window = window or hl.get_active_window()
    if not window then return end

    hl.dispatch(hl.dsp.window.float({ action = "toggle", window=window}))
    if window.floating then
        set_size_percentage(50,50,window)
    end
    hl.dispatch(hl.dsp.window.center({window=window}))
end

function smart_pin(window)
    window = window or hl.get_active_window()
    if not window then return end

    local size = window.size -- only remembers floating size?
    if not window.pinned then
        hl.dispatch(hl.dsp.window.resize({window=window, x=size.x, y=size.y, relative=false}))
        hl.dispatch(hl.dsp.window.float({window=window,action="on"}))
        hl.dispatch(hl.dsp.window.pin({window=window,action="on"}))
    else
        hl.dispatch(hl.dsp.window.pin({window=window,action="off"}))
    end
end

---Checks if file exists before executing it, and returns its value or default_value if not
---@param file any
---@param default_value any
---@return any
function dofile_or_value(file, default_value) 
    if(not io.open(file, "r")) then return default_value end

    return dofile(file)
end

---Only open a process once
---@param cmd string
---@param kill? boolean If the process is already open, kill it?
function smart_open(cmd, kill)
    local result = execute_and_return("pgrep -fx \"" .. cmd .. "\"")
    if not result then return end

    if string.len(result) == 0 then
        hl.exec_cmd(cmd)
    elseif kill then
        hl.exec_cmd("kill " .. result)
    end
end
if hl.plugin.darkwindow then
    hl.plugin.darkwindow.load_shader("shadow", {
        path=Globals.shaderPath.."shadow.glsl",
        args={
            offset={0.003, 0.003},
            opacity=0.5
        }
    })

    hl.plugin.darkwindow.load_shader("opacity", {
        path=Globals.shaderPath.."opacity.glsl",
        args = {
            opacity=0.5
        }
    })
end
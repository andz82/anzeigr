gl.setup(1366, 768)

json = require "json"

font = resource.load_font("silkscreen.ttf")

util.loaders.json = function(filename)
    return json.decode(resource.load_file(filename))
end

util.auto_loader(_G)


function node.render()
    gl.clear(0, 0, 0, 1) -- black background

    -- render logo
    resource.render_child("header"):draw(0, 0, WIDTH, 100)

    font:write(100, 200, "current state:", 110, 1,1,1,1)
    -- show spacestate
    font:write(100, 350, spaceapi.state.message, 130, 1,1,0,1)

end

gl.setup(1366, 768)

local playlist
local current_video_idx

util.file_watch("playlist.txt", function(content) 
    playlist = {}
    for filename in string.gmatch(content, "[^\r\n]+") do
        playlist[#playlist+1] = filename
    end
    current_video_idx = 0
    print("new playlist")
    pp(playlist)
end)

function next_video()
    current_video_idx = current_video_idx + 1
    if current_video_idx > #playlist then
        current_video_idx = 1
    end
    video = util.videoplayer(playlist[current_video_idx], {loop=false})
end

function node.render()
    gl.clear(0, 0, 0, 1) -- black background

    -- render logo
    resource.render_child("header"):draw(0, 0, WIDTH, 100)
    if not video or not video:next() then
        next_video()
    end
    util.draw_correct(video, (WIDTH-640)/2, (HEIGHT-480)/2, (WIDTH+640)/2, (HEIGHT+480)/2)
end

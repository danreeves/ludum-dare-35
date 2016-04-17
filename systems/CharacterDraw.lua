local SpriteDraw = tiny.processingSystem()

SpriteDraw.isDraw = true
SpriteDraw.filter = tiny.requireAll('head', 'torso', 'legs')

function SpriteDraw:process(e, dt)
    local dt = love.timer.getDelta()
    local sx = (e.lr == 'right') and 1 or -1

    if e.is_player and e.sprite ~= nil then
        e.sprite:update(dt)
        e.sprite:draw(e.spritesheet, e.x, e.y, 0, sx, 1, e.width/2, e.height/2)
    else
        e.legs.sprite:update(dt)
        e.torso.sprite:update(dt)
        e.head.sprite:update(dt)

        e.legs.sprite:draw(e.spritesheet, e.x, e.y, 0, sx, 1, e.width/2, e.height/2)
        e.torso.sprite:draw(e.spritesheet, e.x, e.y, 0, sx, 1, e.width/2, e.height/2)
        e.head.sprite:draw(e.spritesheet, e.x, e.y, 0, sx, 1, e.width/2, e.height/2)
    end
end

return SpriteDraw

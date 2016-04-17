local SpriteDraw = tiny.processingSystem()

SpriteDraw.isDraw = true
SpriteDraw.filter = tiny.requireAll('head', 'torso', 'legs')

function SpriteDraw:process(e, dt)
    local dt = love.timer.getDelta()
    if e.is_player and e.sprite ~= nil then
        e.sprite:update(dt)
        local sx = (e.lr == 'right') and 1 or -1
        e.sprite:draw(e.spritesheet, e.x, e.y, 0, sx, 1, 26/2)
    else
        love.graphics.draw(e.head.sprite, e.x, e.y - (e.torso.sprite:getHeight() / 2) - (e.head.sprite:getHeight() / 2) )
        love.graphics.draw(e.torso.sprite, e.x, e.y)
        love.graphics.draw(e.legs.sprite, e.x, e.y + (e.torso.sprite:getHeight() / 2) + (e.legs.sprite:getHeight() / 2))
    end
end

return SpriteDraw

local SpriteDraw = tiny.processingSystem()

SpriteDraw.isDraw = true
SpriteDraw.filter = tiny.requireAll('head', 'torso', 'legs')

function SpriteDraw:process(e, dt)
    love.graphics.draw(e.head.sprite, e.x, e.y - (e.torso.sprite:getHeight() / 2) - (e.head.sprite:getHeight() / 2) )
    love.graphics.draw(e.torso.sprite, e.x, e.y)
    love.graphics.draw(e.legs.sprite, e.x, e.y + (e.torso.sprite:getHeight() / 2) + (e.legs.sprite:getHeight() / 2))
end

return SpriteDraw

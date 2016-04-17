local SpriteDraw = tiny.processingSystem()

SpriteDraw.isDraw = true
SpriteDraw.filter = tiny.requireAll('sprite', 'x', 'y')

function SpriteDraw:process(e, dt)
    -- love.graphics.draw(e.sprite, e.x, e.y)
end

return SpriteDraw

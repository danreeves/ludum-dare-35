local PlayerMovement = tiny.processingSystem()

PlayerMovement.isUpdate = true
PlayerMovement.filter = tiny.requireAll('is_player', 'x', 'y')

function PlayerMovement:process(e, dt)

    local xvel = e.xvel
    local yvel = e.yvel
    local speed = e.speed
    local drag = e.drag

    if xvel < 0 then
        xvel = xvel + drag
        if xvel > 0 then xvel = 0 end
    end
    if xvel > 0 then
        xvel = xvel - drag
        if xvel < 0 then xvel = 0 end
    end
    if yvel < 0 then
        yvel = yvel + drag
        if yvel > 0 then yvel = 0 end
    end
    if yvel > 0 then
        yvel = yvel - drag
        if yvel < 0 then yvel = 0 end
    end

    if love.keyboard.isDown('left') then
        xvel = xvel - speed
    end

    if love.keyboard.isDown('right') then
        xvel = xvel + speed
    end

    if love.keyboard.isDown('up') then
        yvel = yvel - speed
    end

    if love.keyboard.isDown('down') then
        yvel = yvel + speed
    end

    e.xvel = xvel
    e.yvel = yvel

    e.x = e.x + e.xvel
    e.y = e.y + e.yvel

end

return PlayerMovement

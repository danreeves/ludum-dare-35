local PlayerMovement = tiny.processingSystem()

PlayerMovement.isUpdate = true
PlayerMovement.filter = tiny.requireAll('is_player', 'x', 'y')

function PlayerMovement:process(e, dt)

    local xvel = e.xvel
    local yvel = e.yvel
    local accel = e:getAccel()
    local drag = e:getDrag()
    local max_speed = e:getMaxSpeed()

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

    if math.abs(xvel) < max_speed then

        if love.keyboard.isDown('left') then
            xvel = xvel - accel
        end

        if love.keyboard.isDown('right') then
            xvel = xvel + accel
        end

    end

    if math.abs(yvel) < max_speed then

        if love.keyboard.isDown('up') then
            yvel = yvel - accel
        end

        if love.keyboard.isDown('down') then
            yvel = yvel + accel
        end

    end

    e.xvel = xvel
    e.yvel = yvel

    e.x = e.x + e.xvel
    e.y = e.y + e.yvel

end

return PlayerMovement

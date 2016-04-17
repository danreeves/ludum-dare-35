local Hit = require('lib.hit')
local PlayerMovement = tiny.processingSystem()

PlayerMovement.isUpdate = true
PlayerMovement.filter = tiny.requireAll('is_player', 'x', 'y')

function PlayerMovement:new(map)
    local new = {}
    setmetatable(new, self)
    self.__index = self
    new.map = map
    return new
end

function PlayerMovement:process(e, dt)

    local oldx = e.x
    local oldy = e.y
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

    local hit = Hit:init(self.map, 'Walls')
    -- 26 is sprite width
    local nextx = (xvel < 0) and -1 or 26 + 1
    local nexty = (yvel < 0) and -46 - 1 or 46

    if hit:tile(e.x + nextx, e.y) then
        xvel = 0
    end
    if hit:tile(e.x, e.y + nexty) then
        yvel = 0
    end

    e.xvel = xvel
    e.yvel = yvel
    e.x = e.x + e.xvel
    e.y = e.y + e.yvel

    if love.keyboard.isDown('left') or love.keyboard.isDown('right') then
        e.lr = (oldx > e.x) and 'left' or 'right'
    end
    if love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        e.ud = (oldy > e.y) and 'up' or 'down'
    end
    if e.x == oldx and e.y == oldy then
        e.sprite = (e.ud == 'up') and e.animations.idle_up or e.animations.idle_down
    end

    if love.keyboard.isDown('up', 'down', 'left', 'right') then
        e.sprite = (oldy > e.y) and e.animations.walk_up or e.animations.walk_down
    end

end

return PlayerMovement

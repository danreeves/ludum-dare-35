local Hit = require('lib.hit')
local allOf = require('lib.allOf')
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
    local nextx = (xvel < 0) and -e.width/2 or e.width/2
    local nexty = (yvel < 0) and -e.height/5 or e.height/2

    if  hit:tile(e.x + nextx + xvel, e.y) or
        hit:tile(e.x + nextx + xvel, e.y + e.height/3) or
        hit:tile(e.x + nextx + xvel, e.y - e.height/3) then
            xvel = 0
    end

    if  hit:tile(e.x,             e.y + nexty + yvel) or
        hit:tile(e.x + e.width/3, e.y + nexty + yvel) or
        hit:tile(e.x - e.width/3, e.y + nexty + yvel) then
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
        if e.w_sprite then
            e.w_sprite = (e.ud == 'up') and e.w_animations.idle_up or e.w_animations.idle_down
        end
        if allOf(e.head, e.torso, e.legs) then
            e.head.sprite = (e.ud == 'up') and e.head.animations.idle_up or e.head.animations.idle_down
            e.torso.sprite = (e.ud == 'up') and e.torso.animations.idle_up or e.torso.animations.idle_down
            e.legs.sprite = (e.ud == 'up') and e.legs.animations.idle_up or e.legs.animations.idle_down
        end
    end

    if love.keyboard.isDown('up', 'down', 'left', 'right') then
        if e.w_sprite then
            e.w_sprite = (oldy > e.y) and e.w_animations.walk_up or e.w_animations.walk_down
        end
        if allOf(e.head, e.torso, e.legs) then
            e.head.sprite = (oldy > e.y) and e.head.animations.walk_up or e.head.animations.walk_down
            e.torso.sprite = (oldy > e.y) and e.torso.animations.walk_up or e.torso.animations.walk_down
            e.legs.sprite = (oldy > e.y) and e.legs.animations.walk_up or e.legs.animations.walk_down
        end
    end

end

return PlayerMovement

local anim8 = require('lib.anim8')
local AbstractPart = require('entities.AbstractPart')
local Legs = {}

function Legs:new(sprite_path, max_speed, accel)
    local new = AbstractPart:new(sprite_path)

    new.max_speed = max_speed or nil
    new.accel = accel or nil

    new.grids = {
        idle_up    = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*4, 0),
        walk_up    = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*6, 0),
        punch_up   = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*4, 0),

        idle_down  = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*4, 0),
        walk_down  = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*5, 0),
        punch_down = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*4, 0),
    }

    new.animations = {
        idle_up    = anim8.newAnimation(new.grids.idle_up(1,1), {1}),
        walk_up    = anim8.newAnimation(new.grids.walk_up('1-2',1), 0.5),
        punch_up   = anim8.newAnimation(new.grids.punch_up(1,1), {1}),

        idle_down  = anim8.newAnimation(new.grids.idle_down(1,1), {1}),
        walk_down  = anim8.newAnimation(new.grids.walk_down('1-2',1), 0.5),
        punch_down = anim8.newAnimation(new.grids.punch_down(1,1), {1}),
    }

    new.sprite = new.animations.idle_down

    return new
end

return Legs

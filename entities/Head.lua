local anim8 = require('lib.anim8')
local AbstractPart = require('entities.AbstractPart')
local Head = {}

function Head:new(sprite_path)
    local new = AbstractPart:new(sprite_path)

    new.grids = {
        idle_up    = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*1, 0),
        walk_up    = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*1, 0),
        punch_up   = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*1, 0),

        idle_down  = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 0, 0),
        walk_down  = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 0, 0),
        punch_down = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 0, 0),
    }

    new.animations = {
        idle_up    = anim8.newAnimation(new.grids.idle_up(1,1), {1}),
        walk_up    = anim8.newAnimation(new.grids.idle_up(1,1), {1}),
        punch_up   = anim8.newAnimation(new.grids.idle_up(1,1), {1}),
        idle_down  = anim8.newAnimation(new.grids.idle_down(1,1), {1}),
        walk_down  = anim8.newAnimation(new.grids.idle_down(1,1), {1}),
        punch_down = anim8.newAnimation(new.grids.idle_down(1,1), {1}),
    }

    new.sprite = new.animations.idle_down

    return new
end

return Head

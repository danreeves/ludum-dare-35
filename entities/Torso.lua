local anim8 = require('lib.anim8')
local AbstractPart = require('entities.AbstractPart')
local Torso = {}

function Torso:new(sprite_path, id, str, drag)
    local new = AbstractPart:new(sprite_path, id)

    new.str = str or nil
    new.drag = drag or nil

    new.grids = {
        idle_up    = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*3, 0),
        walk_up    = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*5, 0),
        punch_up   = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*7, 0),

        idle_down  = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*2, 0),
        walk_down  = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*4, 0),
        punch_down = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*6, 0),
    }

    new.animations = {
        idle_up    = anim8.newAnimation(new.grids.idle_up('1-2', 1), 0.5),
        walk_up    = anim8.newAnimation(new.grids.walk_up('1-2', 1), 0.35),
        punch_up   = anim8.newAnimation(new.grids.punch_up('1-2', 1), 0.5),

        idle_down  = anim8.newAnimation(new.grids.idle_down('1-2', 1), 0.5),
        walk_down  = anim8.newAnimation(new.grids.walk_down('1-2', 1), 0.35),
        punch_down = anim8.newAnimation(new.grids.punch_down('1-2', 1), 0.5),
    }

    new.sprite = new.animations.idle_down

    return new
end

return Torso

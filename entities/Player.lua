local anim8 = require('lib.anim8')
local AbstractCharacter = require('entities.AbstractCharacter')
local Head = require('entities.Head')
local Torso = require('entities.Torso')
local Legs = require('entities.Legs')
local Player = {}

function Player:new()
    local new = AbstractCharacter:new()

    new.is_player = true
    new.spritesheet = love.graphics.newImage('assets/sprites/wizard.png')
    new.grids = {
        idle_up    = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 0, 0),
        walk_up    = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*1, 0),
        punch_up   = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*2, 0),
        idle_down  = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*3, 0),
        walk_down  = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*4, 0),
        punch_down = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*5, 0),
        transform  = anim8.newGrid(26, 42, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 42*6, 0),

    }
    new.animations = {
        idle_up    = anim8.newAnimation(new.grids.idle_up(1,1, 2,1, 1,1), {1, 0.5, 1}),
        walk_up    = anim8.newAnimation(new.grids.walk_up('1-2',   1), 0.5),
        punch_up   = anim8.newAnimation(new.grids.punch_up('1-2',  1),   2),
        idle_down  = anim8.newAnimation(new.grids.idle_down(1,1, 2,1, 1,1), {1, 0.5, 1}),
        walk_down  = anim8.newAnimation(new.grids.walk_down('1-2', 1), 0.5),
        punch_down = anim8.newAnimation(new.grids.punch_up('1-2',  1),   2),
        transform  = anim8.newAnimation(new.grids.transform('1-2', 1),   1),
    }
    new.sprite = new.animations.idle_down

    return new
end

return Player

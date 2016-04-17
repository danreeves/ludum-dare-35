local anim8 = require('lib.anim8')
local AbstractCharacter = require('entities.AbstractCharacter')
local Head = require('entities.Head')
local Torso = require('entities.Torso')
local Legs = require('entities.Legs')
local Player = {}

function Player:new()
    local new = AbstractCharacter:new()

    new.is_player = true
    new.spritesheet = love.graphics.newImage('assets/sprites/back-wizard.png')
    new.grids = {
        transform_up = anim8.newGrid(26, 46, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 0, 0),
        idle_up = anim8.newGrid(26, 46, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 46, 0),
        punch_up = anim8.newGrid(26, 46, new.spritesheet:getWidth(), new.spritesheet:getHeight(), 0, 46*2, 0)
    }
    new.animations = {
        transform_up = anim8.newAnimation(new.grids.transform_up('1-2', 1), 0.1),
        idle_up = anim8.newAnimation(new.grids.idle_up('1-2', 1), 2),
        punch_up = anim8.newAnimation(new.grids.punch_up('1-2', 1), 2)
    }
    new.sprite = new.animations.punch_up

    return new
end

return Player

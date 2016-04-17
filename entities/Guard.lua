local anim8 = require('lib.anim8')
local AbstractCharacter = require('entities.AbstractCharacter')
local Head = require('entities.Head')
local Torso = require('entities.Torso')
local Legs = require('entities.Legs')
local Guard = {}

function Guard:new(sprite_sheet)
    local new = AbstractCharacter:new()

    new.is_guard = true
    new.head = Head:new(sprite_sheet)
    new.torso = Torso:new(sprite_sheet)
    new.legs = Legs:new(sprite_sheet)
    new.spritesheet = love.graphics.newImage(sprite_sheet)

    return new
end

return Guard

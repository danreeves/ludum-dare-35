local anim8 = require('lib.anim8')
local Path = require('lib.GuardPatrol')
local AbstractCharacter = require('entities.AbstractCharacter')
local Head = require('entities.Head')
local Torso = require('entities.Torso')
local Legs = require('entities.Legs')
local Guard = {}

function Guard:new(sprite_sheet, pathArr)
    local new = AbstractCharacter:new()

    new.is_guard = true
    new.head = Head:new(sprite_sheet, 1)
    new.torso = Torso:new(sprite_sheet, 1)
    new.legs = Legs:new(sprite_sheet, 1)
    new.spritesheet = love.graphics.newImage(sprite_sheet)

    new.path = Path:new(pathArr) or nil

    return new
end

return Guard

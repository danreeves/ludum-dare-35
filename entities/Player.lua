local AbstractCharacter = require('entities.AbstractCharacter')
local Head = require('entities.Head')
local Torso = require('entities.Torso')
local Legs = require('entities.Legs')
local Player = {}

function Player:new()
    local new = AbstractCharacter:new()

    new.is_player = true
    new.head = Head:new('assets/img/head.png')
    new.torso = Torso:new('assets/img/torso.png')
    new.legs = Legs:new('assets/img/legs.png')

    return new
end

return Player

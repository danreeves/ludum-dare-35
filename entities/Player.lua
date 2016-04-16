local AbstractCharacter = require('entities.AbstractCharacter')
local Player = {}

function Player:new()
    local new = AbstractCharacter:new()

    new.is_player = true
    new.sprite = love.graphics.newImage('assets/img/player.png')

    return new
end

return Player

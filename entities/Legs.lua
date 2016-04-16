local AbstractPart = require('entities.AbstractPart')
local Legs = {}

function Legs:new(sprite_path, max_speed, accel)
    local new = AbstractPart:new(sprite_path)

    new.max_speed = max_speed
    new.accel = accel

    return new
end

return Legs

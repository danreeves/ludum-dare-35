local AbstractPart = require('entities.AbstractPart')
local Torso = {}

function Torso:new(sprite_path, str, drag)
    local new = AbstractPart:new(sprite_path)

    new.str = str
    new.drag = drag

    return new
end

return Torso

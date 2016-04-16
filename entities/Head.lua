local AbstractPart = require('entities.AbstractPart')
local Head = {}

function Head:new(sprite_path)
    local new = AbstractPart:new(sprite_path)
    return new
end

return Head

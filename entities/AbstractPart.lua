local AbstractPart = {
    sprite = {}
}

function AbstractPart:new(sprite_path)
    local new = {}
    setmetatable(new, self)
    self.__index = self

    new.sprite = love.graphics.newImage(sprite_path)

    return new
end

return AbstractPart

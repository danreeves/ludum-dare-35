local AbstractPart = {
    sprite = {}
}

local stubAnimation = {}
function stubAnimation:update()
end
function stubAnimation:flipH()
end
function stubAnimation:draw(img, x, y, r, sx, sy, ox, oy)
    love.graphics.draw(img, x, y, r, sx, sy, ox, oy)
end


function AbstractPart:new(sprite_path)
    local new = {}
    setmetatable(new, self)
    self.__index = self

    new.sprite = stubAnimation
    new.spritesheet = love.graphics.newImage(sprite_path)

    return new
end

return AbstractPart

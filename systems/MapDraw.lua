local MapDraw = tiny.system()

MapDraw.isDraw = true

function MapDraw:new(map)
    local new = {}
    setmetatable(new, self)
    self.__index = self
    new.map = map
    return new
end

function MapDraw:update(dt)
    self.map:draw()
end

return MapDraw

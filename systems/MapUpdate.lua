local MapUpdate = tiny.system()

MapUpdate.isUpdate = true

function MapUpdate:new(map)
    local new = {}
    setmetatable(new, self)
    self.__index = self
    new.map = map
    return new
end

function MapUpdate:update(dt)
    self.map:update(dt)
end

return MapUpdate

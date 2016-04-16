local AbstractCharacter = {
    x = 0,
    y = 0,
    xvel = 0,
    yvel = 0,
    speed = 3,
    max_speed = 4,
    drag = 1,
    head = {},
    torso = {},
    legs = {},
    hp = 0,
    mp = 0,
    transformation_timer = 0,
    visible = true,
}

function AbstractCharacter:new()
    local new = {}
    setmetatable(new, self)
    self.__index = self

    return new
end

return AbstractCharacter

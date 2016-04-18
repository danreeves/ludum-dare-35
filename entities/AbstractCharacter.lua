local either = require('lib.either')
local AbstractCharacter = {
    x = 550,
    y = 550,
    xvel = 0,
    yvel = 0,
    default_str = 0,
    default_accel = 0.3,
    default_max_speed = 1,
    default_drag = 0.1,
    head = {},
    torso = {},
    legs = {},
    hp = 0,
    mp = 0,
    transformation_timer = 0,
    transform_at = false,
    has_transformed = false,
    visible = true,
    lr = 'right',
    ud = 'down',
    height = 40,
    width = 26
}

function AbstractCharacter:new()
    local new = {}
    setmetatable(new, self)
    self.__index = self

    return new
end

function AbstractCharacter:getAccel()
    return either(self.legs.accel, self.default_accel)
end

function AbstractCharacter:getStr()
    return either(self.torso.str, self.default_str)
end

function AbstractCharacter:getMaxSpeed()
    return either(self.legs.max_speed, self.default_max_speed)
end

function AbstractCharacter:getDrag()
    return either(self.torso.drag, self.default_drag)
end

return AbstractCharacter

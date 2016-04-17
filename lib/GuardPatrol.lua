local _ = require('lib.underscore')
local GuardPatrol = {
    timer = 0,
    path = {},
    direction = nil
}

local function pathToDir(path, timer)
    local pathlen = _.reduce(path, 0, function (o, i)
        return o + i.seconds
    end)
    local currtime = (timer > pathlen) and timer%pathlen or timer
    local dir = ''
    local accum = 0

    for i = 0, #path do
        if path[i] ~= nil then
            accum = accum + path[i].seconds
            if currtime < accum then
                dir = path[i].direction
                break
            end
        end
    end

    return dir
end

function GuardPatrol:new(path)
    self.path = path
    return self
end

function GuardPatrol:update(dt)
    self.timer = self.timer + dt
    self.direction = pathToDir(self.path, self.timer)
end

function GuardPatrol:getDirection()
    return self.direction
end

return GuardPatrol

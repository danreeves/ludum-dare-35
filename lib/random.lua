local Random = {
    heads = {},
    torsos = {},
    legsArr = {},
}

local function getRandom (arr)
    return arr[math.random(#arr)]
end

function Random:new(heads, torsos, legs)
    self.heads = heads or {}
    self.torsos = torsos or {}
    self.legsArr = legs or {}
    return self
end

function Random:head()
    return getRandom(self.heads)
end

function Random:torso()
    return getRandom(self.torsos)
end

function Random:legs()
    return getRandom(self.legsArr)
end

return Random

local hit = {
    map = {}
}

function hit:init(map, layer)
    self.map = map
    self.layer = layer
    return self
end

function hit:tile(x, y)
    local tx, ty = self.map:convertScreenToWorld(x, y)
    tx = math.ceil(tx)
    ty = math.ceil(ty)
    local layer = self.map.layers[self.layer]
    local row = (layer ~= nil) and layer.data[ty] or nil
    local tile = (row ~= nil) and row[tx] or nil
    if tile ~= nil then
        return true
    else
        return false
    end
end

return hit

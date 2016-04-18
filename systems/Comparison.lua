local Comparison = tiny.processingSystem()

Comparison.isUpdate = true
Comparison.filter = tiny.requireAll('is_guard')

function Comparison:new(player)
    self.player = player
    return self
end

function Comparison:update(e, dt)



end

return Comparison

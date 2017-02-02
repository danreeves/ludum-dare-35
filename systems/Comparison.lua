local allOf = require('lib.allOf')
local Comparison = tiny.processingSystem()

Comparison.isUpdate = true
Comparison.filter = tiny.requireAll('is_guard')

-- stub
local function canSee (...)
    return true
end
--

function Comparison:new(player)
    self.player = player
    return self
end

function Comparison:process(e, dt)
    if canSee(e, self.player) then
        if allOf(self.player.head, self.player.torso, self.player.legs) then

            local head_diff = math.max(e.head.id, self.player.head.id) - math.min(e.head.id, self.player.head.id)
            local torso_diff = math.max(e.torso.id, self.player.torso.id) - math.min(e.torso.id, self.player.torso.id)
            local legs_diff = math.max(e.legs.id, self.player.legs.id) - math.min(e.legs.id, self.player.legs.id)

            local total_diff = head_diff + torso_diff + legs_diff

            if total_diff < 3.5 then
                print('pass')
            else
                print('fail')
            end

        end
    end
end

return Comparison

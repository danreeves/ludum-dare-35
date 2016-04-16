local sti = require('lib.sti')
local Level1 = {
  mappath = 'assets/maps/level1.lua'
}

function Level1:init()
    -- self.map = sti.new(self.mappath)
    local world = tiny.world(
        require('systems.PlayerMovement'),
        require('systems.SpriteDraw')
    )
    world:addEntity(require('entities.Player'):new())

    _G.world = world
end

return Level1

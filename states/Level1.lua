local Camera = require('lib.hump.camera')
local sti = require('lib.sti')
local Level1 = {
  mappath = 'assets/maps/level1.lua'
}

function Level1:init()
    local map = sti.new('assets/maps/Castle.lua')
    local world = tiny.world(unpack({
        require('systems.MapUpdate'):new(map),
        require('systems.MapDraw'):new(map),
        require('systems.PlayerMovement'):new(map),
        require('systems.GuardMovement'):new(map),
        require('systems.SpriteDraw'),
        require('systems.CharacterDraw'),
        require('systems.CameraTracking'),
    }))
    world:addEntity(require('entities.Player'):new())
    world:addEntity(require('entities.Guard'):new('assets/sprites/elf-1.png', {
        {
            direction = 'left',
            seconds = 1
        },
        {
            direction = '',
            seconds = 1
        },
        {
            direction = 'right',
            seconds = 1
        },
        {
            direction = '',
            seconds = 1
        },
    }))

    _G.camera = Camera(0, 0, 3)
    _G.map = map
    _G.world = world
end

return Level1

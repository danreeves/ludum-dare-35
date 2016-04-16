tiny = require('lib.tiny')
gamestate = require('lib.hump.gamestate')

local Level1 = require('states.Level1')

function love.load()
    if arg[#arg] == "-debug" then require('mobdebug').start() end
    love.graphics.setDefaultFilter('nearest', 'nearest')
    gamestate.registerEvents()
    gamestate.switch(Level1)
end

local drawSystems = function(_, s) return not s.isUpdate end
local updateSystems = function(_, s) return not s.isDraw end
function cameraDraw()
    return _G.world:update(dt, drawSystems)
end

function love.update()
    if _G.world then
        _G.world:update(dt, updateSystems)
    end
end

function love.draw()
    local dt = love.timer.getDelta()
    if _G.world then
        if _G.camera then
            _G.camera:draw(cameraDraw)
        end
    end
end

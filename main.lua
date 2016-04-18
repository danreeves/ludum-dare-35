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
    local dt = love.timer.getDelta()
    return _G.world:update(dt, drawSystems)
end

function love.update(dt)
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

function love.keypressed(key)
    if _G.player ~= nil then
        if key == 'x' and _G.player.mp > 0 then
            print('transforming')
            _G.player.transform = true
            _G.player.mp = _G.player.mp - 1
        end
    end
end

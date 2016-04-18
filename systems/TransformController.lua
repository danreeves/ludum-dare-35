local Random = require('lib.random')
local TransformController = tiny.processingSystem()
local random = Random:new(
    require('entities.allHeads'),
    require('entities.allTorsos'),
    require('entities.allLegs')
)

TransformController.isUpdate = true
TransformController.filter = tiny.requireAll(
    'transformation_timer',
    'has_transformed',
    'transform_at',
    'head',
    'torso',
    'legs'
)

function TransformController:process(e, dt)

    if e.transform then

        e.head = random:head()
        e.torso = random:torso()
        e.legs = random:legs()

        if e.w_sprite ~= nil then
            e.w_sprite = nil
        end

    end

    if e.has_transformed then
        -- do the timer stuff
    end

end

return TransformController

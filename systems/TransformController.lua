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

        e.transform = false
        e.has_transformed = true

        e.head = random:head()
        e.torso = random:torso()
        e.legs = random:legs()

        if e.w_sprite ~= nil then
            e.w_sprite = nil
        end

    end

    if e.has_transformed and e.transform_at ~= false then

        e.transformation_timer = e.transformation_timer + dt
        if e.transformation_timer > e.transform_at then
            e.transformation_timer = 0
            e.transform = true
        end

    end

end

return TransformController

local CameraTracking = tiny.processingSystem()

CameraTracking.isUpdate = true
CameraTracking.filter = tiny.requireAll('is_player', 'x', 'y')

function CameraTracking:process(e, dt)
    _G.camera:lookAt(e.x, e.y)
end

return CameraTracking


function allOf (...)
    local args = {...}
    local all = false
    for i,v in ipairs(args) do
        if (type(v) == 'table') then
            all = next(v) ~= nil
        else
            all = v ~= nil
        end
    end
    return all
end

return allOf

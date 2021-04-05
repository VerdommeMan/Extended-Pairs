local module = {}

local function msiter(t, i)
    i += 1
    local arr = {}

    for j = 1, t.n do
        local v = t.args[j][i]
        if v == nil then
         return 
        end
        arr[j] = v
    end

    return i, unpack(arr)
end

local function mliter(t, i)
    i += 1
    local arr = {}
    local flag = false

    for j = 1, t.n do
        local v = t.args[j][i]
        if v ~= nil then
         flag = true
        end
        arr[j] = v
    end

    return flag and i or nil, unpack(arr, 1, t.n)
end

function module.msipairs(...)
    return msiter, {args = {...}, n = select('#', ...)}, 0
end

function module.mlipairs(...)
    return mliter, {args = {...}, n = select('#', ...)}, 0
end

return module
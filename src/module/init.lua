local module = {}

local function biter(t, i)
    i -= 1
    local v = t[i]
    if v ~= nil then
      return i, v
    end
end

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

local function viter(t, i)
    i += 1
    if i <= t.n then
      return i, t.args[i]
    end
end

local function cnext(t, k)
    local k1, v1 = next(t.args[t.i], k)
    if k1 ~= nil then
        return k1, v1
    elseif t.i < t.n then
        t.i += 1
        return cnext(t, nil)
    end
end

function module.vpairs(...) -- varadic pairs, pass a variadic and it will iterate over it while being nil safe, e.g. loops until select('#', ...) instead of until first nil
    return viter, {args = {...}, n = select('#', ...)}, 0
end

function module.msipairs(...) -- multi shortest ipairs (stops at first nil)
    return msiter, {args = {...}, n = select('#', ...)}, 0
end

function module.mlipairs(...) -- multi longest ipairs (stops when every array is nil)
    return mliter, {args = {...}, n = select('#', ...)}, 0
end

function module.cpairs(...) -- chained pairs ()
    return cnext, {args = {...}, n = select('#', ...), i = 1}, nil
end

function module.bipairs(t) -- backwards ipairs
    return biter, t, #t + 1
end

return module
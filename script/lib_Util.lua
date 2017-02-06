module("Util",package.seeall);
function Map(iterator, func)
    for i=1,#iterator do
        func(iterator[i], i, iterator);
    end
end
function AnchorShift(anchorPos, dstArray, shiftX, shiftY)
    for i=1,math.floor(#anchorPos/2) do
        dstArray[i] = {};
        dstArray[i][1] = anchorPos[i*2-1] + shiftX;
	    dstArray[i][2] = anchorPos[i*2] + shiftY;
    end
end
function Round(x)
    if math.abs(math.floor(x) - x) > math.abs(math.ceil(x) - x) then
        return math.ceil(x);
    end
    return math.floor(x);
end
function Reverse(iterator)
    local rtn = {};
    for i=0,#iterator-1 do
        table.insert(rtn, iterator[#iterator - i]);
    end
    return rtn;
end
function Logistic(x)
    local k = 1;
    local b = 0.3;
    local c = 0.5;
    x = x*15 - 10;
    local tmp = 1 + b*math.exp(-c*x);
    return k/tmp;
end
function Linear(x)
    return x;
end
function Log(x)
    return math.log(x+1, 2);
end
function Pow(x)
    return math.pow(2, x)-1;
end
function Uniform(iterator)
    if #iterator < 1 then return true end
    local value = iterator[1];
    for i=1,#iterator do
        if iterator[i] ~= value then return false end
    end
    return true
end
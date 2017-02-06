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
function MakeRandomTable(count, start, stop)
    --math.randomseed(os.time()*math.random());
    local rtn = {};
    for i=0,count do
        table.insert(rtn, math.random(start, stop));
    end
    return rtn;
end
function MakeRandomDoubleTable(count, start, stop, seed)
    local rtn = {};
    math.randomseed(seed);
    rtn[1] = MakeRandomTable(count, start, stop);
    math.randomseed(seed%2525);
    rtn[2] = MakeRandomTable(count, start, stop);
    return rtn;
end
function BreakMask(count, pointSrc, offsetX, offsetY, size, max)
    for i=1, count do
        --マスク
        obj.effect("マスク",
            "X",pointSrc[1][i]+offsetX,
            "Y",pointSrc[2][i]+offsetY,
            "サイズ",size * i/max,
            "マスクの反転",1,
            "type",5
        );
    end
end